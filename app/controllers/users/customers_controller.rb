class Users::CustomersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_customer, only: [:show]
  layout 'users'
   
  def index
    @customers = Customer.all
  end
  
  def show
    customers = Customer.all
    
    #GoogleMapの緯度経度表す為
    gon.customer = @customer
    
  end
  
  def search
    if params[:last_name].present?
      @customers = Customer.get_by_last_name params[:last_name]
    else
      @customers = Customer.all
    end
    render 'index'
  end
  
  private
  
  def find_customer
    @customer = Customer.find(params[:id])
  end
 
end
