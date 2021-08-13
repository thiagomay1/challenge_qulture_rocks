class Employee::DeleteFromCompany
  def initialize(params)
    @company_id = params[:company_id]
    @employee_id = params[:id]
  end

  def call
    Company.find(company_id)
      .employees
      .destroy(employee_id)
  end

  private
  attr_reader :company_id, :employee_id
end
