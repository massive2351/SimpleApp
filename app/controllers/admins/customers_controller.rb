class Admins::CustomersController < ApplicationController
  before_action :authenticate_admin!
  before_action :find_customer, only: [:show, :edit, :update]
  layout 'admins'

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
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
    @shifts = @customer.shifts
    
    #GoogleMapの緯度経度表す為
    gon.customer = @customer

  end

  def edit
  end

  def update
    if @customer.update(customer_params)
      redirect_to admins_customer_path(@customer)
      flash[:notice] = "利用者情報を更新しました"
    else
      render :edit
    end
  end

  def search
    #名前検索
    
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
  
  def customer_params
    params.require(:customer).permit(:image, :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email, :latitude, :longitude)
  end

end

