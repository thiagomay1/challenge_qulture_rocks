require 'rails_helper'

RSpec.describe Employee::GetSecondTierSubordinates do
  let(:company) { create(:company) }
  let(:leader) { create(:employee, company: company) }
  let(:subordinate1) { create(:employee, company: company) }
  let(:subordinate2) { create(:employee, company: company) }
  let(:second_tier_subordinate1) { create(:employee, company: company) }
  let(:second_tier_subordinate2) { create(:employee, company: company) }
  let(:second_tier_subordinate3) { create(:employee, company: company) }
  let(:second_tier_subordinate4) { create(:employee, company: company) }
  before(:each) do
    leader.add_subordinate!(subordinate1)
    leader.add_subordinate!(subordinate2)

    subordinate1.add_subordinate!(second_tier_subordinate1)
    subordinate1.add_subordinate!(second_tier_subordinate2)
    subordinate2.add_subordinate!(second_tier_subordinate3)
    subordinate2.add_subordinate!(second_tier_subordinate4)
  end

  it "return only employee of company" do
    service = Employee::GetSecondTierSubordinates.new(leader.id)

    result = service.call

    expect(result.count).to be 4
    expect(result).to all(be_an(Employee)) 
    subordinate_ids = result.map {|x| x.id}
    expect(subordinate_ids).to include(second_tier_subordinate1.id, second_tier_subordinate2.id, second_tier_subordinate3.id, second_tier_subordinate4.id)
  end
end
