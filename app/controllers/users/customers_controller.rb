class Users::CustomersController < ApplicationController
  before_action :authenticate_user!
   layout 'users'
  def index
    @customers = Customer.all
  end
  
  def show
    @customer = Customer.find(params[:id])
    customers = Customer.all
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
 
end
