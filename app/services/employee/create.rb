class Employee::Create
  def initialize(company:, name:, email:)
    @name = name
    @email = email
  end

  def call
    Employee.create!(email: email, name: name)
  end

  private 
  attr_reader :name, :email
end
