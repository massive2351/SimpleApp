class Admins::CustomersController < ApplicationController
  
  layout 'admins'
  
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
    @shifts = @customer.shifts
  end
  
  def edit
    @customer = Customer.find(params[:id])
  end
  
  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to admins_customer_path(@customer)
      flash[:notice] = "利用者情報を更新しました"
    else
      render :show
    end
  end

  def destroy
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
  def customer_params
    params.require(:customer).permit(:image, :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email)
  end
  
end
