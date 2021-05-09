class Admins::ShiftsController < ApplicationController
  layout 'admins'

  def index
    @shifts = Shift.all
    @shift_today = Shift.where("DATE(start_time) = '#{Date.today}'")
    @users = User.all
    @sequence = 1.step
  end
  
  

  def new
    @shift = Shift.new
    @users =  User.all
    @customers = Customer.all
  end

  def create
    params[:shift][:status] = params[:shift][:status].to_i
    @shift = Shift.new(shift_params)
    @shift.staff = User.find(params[:shift][:user_id]).last_name
    @shift.customer_na = Customer.find(params[:shift][:customer_id]).last_name
    if @shift.save!
      flash[:notice] = "シフトを追加しました"
      redirect_to admins_root_path
    else
      render :index
    end
  end


  def show
    @shift = Shift.find(params[:id])
  end

  def edit
    @users =  User.all
    @customers = Customer.all
    @shift = Shift.find(params[:id])
  end

  def update
    @shift = Shift.find(params[:id])
    @shift.staff = User.find(params[:shift][:user_id]).last_name
    @shift.customer_na = Customer.find(params[:shift][:customer_id]).last_name
    if @shift.update(shift_params)
      redirect_to admins_root_path
      flash[:notice] = "シフトを更新しました"
    else
      render :index
    end
  end

  def search
  end
  
  private
  def shift_params
    params.require(:shift).permit(:start_time, :end_time, :type, :work, :staff, :user_id, :customer_id, :customer_na, :status)
  end

  

end
