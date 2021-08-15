class Employee::AddSubordinate
  def initialize(params)
    @subordinate_id = params[:subordinate_id]
    @leader_id = params[:leader_id]
  end

  def call
    leader = Employee.find_by(id: leader_id)
    raise Employee::Exceptions::LeaderNotFound if leader.nil?
    subordinate = Employee.find_by(id: subordinate_id)
    raise Employee::Exceptions::SubordinateNotFound if subordinate.nil? 
    leader.add_subordinate!(subordinate)
  end

  private
  attr_reader :leader_id, :subordinate_id
end
