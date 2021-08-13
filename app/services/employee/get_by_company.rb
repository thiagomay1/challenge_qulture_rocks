class Employee::GetByCompany
  def initialize(params)
    @company_id = params[:company_id]
  end

  def call
    Company.find(company_id).employees
  end

  private
  attr_reader :company_id
end
