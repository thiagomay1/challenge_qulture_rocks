class CompaniesController < ApplicationController
  def index
    service = Company::GetAll.new
    result = service.call
    render json: result
  end

  def show
    result = Company::GetById.new(params[:id].to_i).call
    render json: result
  end

  def create
    result = Company::Create.new(company_params).call
    render json: result
  end

  private 
  def company_params 
    params.require(:company).permit(:name)
  end
end
