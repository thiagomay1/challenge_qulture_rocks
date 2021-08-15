class Employee::Create
  def initialize(params)
    @name = params[:name]
    @email = params[:email]
    @company_id = params[:company_id]
  end

  def call
    Employee.create!(email: email, name: name, company_id: company_id)
  end

  private 
  attr_reader :name, :email, :company_id
end
