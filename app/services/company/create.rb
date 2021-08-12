class Company::Create
  def initialize(params)
    @name = params[:name]
  end

  def call
    Company.create!(name: name)
  end

  private 
  attr_reader :name
end
