class RequestsController < ApplicationController


  def index
    @requests = Request.all
  end

  def show
    @request = Request.find(params[:id])
  end

  def new
    @request = Request.new
    @insuranceservices = InsuranceService.all
  end

  def create
    @request = Request.new(user_id: current_user.id, insurance_service_id: params[:insurance_service_id], first_name: params[:first_name], last_name: params[:last_name], description: params[:description], email: params[:email], phone_number: params[:phone_number], dashboard_id: params[:dashboard_id])
      if @request.save
      redirect_to "/requests/#{@request.id}"
    else
      render 'new'
    end
  end
end
