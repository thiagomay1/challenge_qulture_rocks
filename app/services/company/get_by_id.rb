class Company::GetById 
  def initialize(id)
    @id = id
  end

  def call
    Company.find_by(id: id)
  end

  private
    attr_reader :id
end
