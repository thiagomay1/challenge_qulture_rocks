class EmployeesController < ApplicationController
  def index
    service = Employee::GetByCompany.new(params)
    result = service.call
    render json: result
  end
end
