class EmployeesController < ApplicationController
  def index
    service = Employee::GetByCompany.new(params)
    result = service.call
    render json: result
  end

  def destroy
    Employee::DeleteFromCompany.new(delete_params).call
  end

  def leader
    Employee::AddSubordinate.new(leader_params).call
    render status: 200
  end

  rescue_from Employee::Exceptions::LoopLeadership do |exception|
    render json: exception, status: 400
  end

  rescue_from Employee::Exceptions::OtherCompanyEmployee do |exception|
    # TODO makes more sense pass company_id together and return a user not found error
    render json: exception, status: 409
  end

  rescue_from Employee::Exceptions::LeaderNotFound do |exception|
    render json: exception, status: 404
  end

  rescue_from Employee::Exceptions::SubordinateNotFound do |exception|
    render json: exception, status: 404
  end

  private
  def delete_params
    params.permit(:id, :company_id)
  end

  def leader_params
    params.permit(:leader_id, :subordinate_id)
  end

end
