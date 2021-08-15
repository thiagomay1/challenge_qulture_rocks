class Employee::GetPeers
  def initialize(employee_id)
    @employee_id = employee_id
  end

  def call
    leader = Employee.find(employee_id).leader
    return [] if leader.nil?
    leader
      .subordinates
      .where
      .not(id: employee_id)
  end

  private
  attr_reader :employee_id
end
