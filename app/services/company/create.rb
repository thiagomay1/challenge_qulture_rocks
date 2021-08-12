class Company::Create
  def initialize(name)
    @name = name
  end

  def call
    Company.create!(name: name)
  end

  private 
  attr_reader :name
end
