require 'rails_helper'

RSpec.describe Employee::GetPeers do
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

  it "return peers when has leader" do
    service = Employee::GetPeers.new(subordinate1.id)

    result = service.call

    expect(result.count).to be 2
    peers_id = result.map {|x| x.id}
    expect(peers_id).to include(subordinate2.id, subordinate3.id)
  end

  it "return empty list when has no leader" do
    unsubordinate_employee = create(:employee, company: company)
    service = Employee::GetPeers.new(unsubordinate_employee.id)

    result = service.call

    expect(result.count).to be 0
  end
end
