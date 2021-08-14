require 'rails_helper'

RSpec.describe Employee, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:email) }
  it { should belong_to(:company) }
  it { is_expected.to allow_value("email@addresse.foo").for(:email) }
  it { is_expected.to_not allow_value("foo").for(:email) }

  context '#add_subordinate!' do
    let(:company) { create(:company) }
    let(:leader) { create(:employee, company: company) }
    let(:subordinate) { create(:employee, company: company) }

    it 'should initialize without subordinate' do
      expect(leader.subordinates.count).to be 0
    end

    it 'should not allow subordinate from other company' do
      other_company = create(:company)
      other_company_employee = create(:employee, company: other_company)
      expect { leader.add_subordinate!(other_company_employee) }.to raise_error Exceptions::OtherCompanyEmployee
      expect(leader.subordinates.count).to be 0
    end

    it 'should add a subordinate' do
      leader.add_subordinate!(subordinate)

      expect(leader.subordinates.count).to be 1
      expect(leader.subordinates.first.id).to be subordinate.id
    end

    it 'subordinate should have only one leader' do
      new_leader = create(:employee, company: company)

      leader.add_subordinate!(subordinate)
      new_leader.add_subordinate!(subordinate)

      expect(subordinate.leader.id).to be new_leader.id
    end

    it 'should not allow loop with leader' do
      loop_leader = create(:employee, name: "loop_leader", company: company)

      loop_leader.add_subordinate!(leader)
      leader.add_subordinate!(subordinate)

      expect { subordinate.add_subordinate!(loop_leader) }.to raise_error Exceptions::LoopLeadership
    end

  end

  context '#add_leader' do
    let(:company) { create(:company) }
    let(:leader) { create(:employee, name: "leader", company: company) }
    let(:subordinate) { create(:employee, name: "subordinate", company: company) }

    it 'should initialize without leader' do
      expect(subordinate.leader).to be_nil
    end

    it 'should not allow subordinate from other company' do
      other_company = create(:company)
      other_company_employee = create(:employee, company: other_company)

      expect { subordinate.leader!(other_company_employee) }.to raise_error Exceptions::OtherCompanyEmployee
      expect(leader.subordinates.count).to be 0
    end

    it 'should add a subordinate' do
      subordinate.leader!(leader)

      expect(subordinate.leader).not_to be_nil
      expect(subordinate.leader.id).to be leader.id
    end

    it 'should have only one leader' do
      new_leader = create(:employee, company: company)

      subordinate.leader!(leader)
      subordinate.leader!(new_leader)

      expect(subordinate.leader.id).to be new_leader.id
    end


    it 'should not allow loop with leader' do
      loop_leader = create(:employee, name: "loop_leader", company: company)

      subordinate.leader!(leader)
      leader.leader!(loop_leader)

      expect { loop_leader.leader!(subordinate) }.to raise_error Exceptions::LoopLeadership
    end
  end
end
