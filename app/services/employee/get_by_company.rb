class Employee::GetByCompany
  def initialize(company_id)
    @company_id = company_id
  end

  def call
    Company.find(company_id).employees
  end

  private
  attr_reader :company_id
end
