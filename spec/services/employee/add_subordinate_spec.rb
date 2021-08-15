require 'rails_helper'

RSpec.describe Employee::AddSubordinate do
  let!(:company) { create(:company) }
  let!(:leader) { create(:employee, company: company) }
  let!(:subordinate) { create(:employee, company: company) }

  it 'raises error if leader is not found' do
    params = { :employee_id => 50, :subordinate_id => subordinate.id } 
    expect { Employee::AddSubordinate.new(params).call }.to raise_error Employee::Exceptions::LeaderNotFound
  end

  it 'raises error if subordinate is not found' do
    params = { :employee_id => leader.id, :subordinate_id => 50 } 
    expect { Employee::AddSubordinate.new(params).call }.to raise_error Employee::Exceptions::SubordinateNotFound
  end

  it 'should add subordiante to leader' do 
    params = { :employee_id => leader.id, :subordinate_id => subordinate.id } 

    Employee::AddSubordinate.new(params).call

    leader.reload
    subordinate.reload
    expect(leader.subordinates.count).to be 1
    expect(leader.subordinates.first.id).to be subordinate.id
    expect(subordinate.leader.id).to be leader.id
  end
end
