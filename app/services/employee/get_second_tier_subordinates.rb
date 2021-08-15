class Employee::GetSecondTierSubordinates
  def initialize(leader_id)
    @leader_id = leader_id
  end

  def call
    subordinate_ids = Employee
      .where(leader_id: leader_id)
      .pluck(:id)
    Employee.where(leader_id: subordinate_ids)
  end

  private
  attr_reader :leader_id
end
