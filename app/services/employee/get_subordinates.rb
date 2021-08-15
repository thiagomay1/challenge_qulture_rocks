class Employee::GetSubordinates
  def initialize(leader_id)
    @leader_id = leader_id
  end

  def call
    Employee.find(leader_id).subordinates
  end

  private
  attr_reader :leader_id
end
