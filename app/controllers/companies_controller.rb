class CompaniesController < ApplicationController

  def index
    @companies = Company.all
  end

  def show
    @company = Company.find_by(id: params[:id])
    @insuranceservices = InsuranceService.all
  end

  def new
    @company = Company.new
    @users = User.all
  end

  def create
    @company = Company.new({name: params[:name], logo: params[:logo], description: params[:description], address: params[:address], email: params[:email], phone_number: params[:phone_number], pobox: params[:pobox]})
    @company.save
    redirect_to "/companies/#{@company.id}"
  end

  def edit
    @company = Company.find_by(id: params[:id])
    @users = User.all
  end

  def update
    @company = Company.find_by(id: params[:id])
    @company.name = params[:name]
    @company.logo = params[:logo]
    @company.description = params[:description]
    @company.address = params[:address]
    @company.email = params[:email]
    @company.phone_number = params[:phone_number]
    @company.pobox = params[:pobox]
    @company.save
    redirect_to "/companies/#{@company.id}"
  end

  def destroy
    @company = Company.find_by(id: params[:id])
    @company.destroy 
    redirect_to "/companies"
  end

  def search
    search_query = params[:search_input]
    @companies = Company.where("name LIKE ?", "%#{search_query}%")
    if @companies.empty?
      flash[:info] = "No company found in search"
    end
    render :index
  end
end
