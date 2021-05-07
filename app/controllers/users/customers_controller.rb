class Users::CustomersController < ApplicationController
   layout 'users'
  def index
    @customers = Customer.all
  end
  
  def show
    @customer = Customer.find(params[:id])
  end
  
end
