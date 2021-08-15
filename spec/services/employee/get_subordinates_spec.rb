require 'rails_helper'

RSpec.describe Employee::GetSubordinates do
  let(:company) { create(:company) }
  let(:leader) { create(:employee, company: company) }
  let(:subordinate1) { create(:employee, company: company) }
  let(:subordinate2) { create(:employee, company: company) }
  let(:subordinate3) { create(:employee, company: company) }
  before(:each) do
    leader.add_subordinate!(subordinate1)
    leader.add_subordinate!(subordinate2)
    leader.add_subordinate!(subordinate3)
  end

  it "return only employee of company" do
    service = Employee::GetSubordinates.new(leader.id)

    result = service.call

    expect(result.count).to be 3
    expect(result).to all( be_an(Employee) ) 
    subordinate_ids = result.map {|x| x.id}
    expect(subordinate_ids).to include(subordinate1.id, subordinate2.id, subordinate3.id)
  end
end
