class Admins::CustomersController < ApplicationController
  
  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save!
      flash[:notice] = "新規利用者を追加しました"
      redirect_to admins_customers_path
    else
      render :new
    end
  end

  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def destroy
  end
  
  private
  def customer_params
    params.require(:customer).permit(:image, :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email)
  end
  
end
