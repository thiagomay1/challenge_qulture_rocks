class EmployeesController < ApplicationController
  def index
    service = Employee::GetByCompany.new(params)
    result = service.call
    render json: result
  end

  def destroy
    Employee::DeleteFromCompany.new(delete_params).call
  end

  private
  def delete_params
    params.permit(:id, :company_id)
  end
end
