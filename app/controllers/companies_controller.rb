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
end
