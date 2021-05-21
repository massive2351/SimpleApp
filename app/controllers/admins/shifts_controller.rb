class Admins::ShiftsController < ApplicationController


  layout 'admins'

  def index
    shifts = Shift.all
    @shifts = shifts.order(:start_time)
    
    @users = User.all
    @sequence = 1.step

    @shift = Shift.new
    @users =  User.all
    @customers = Customer.all
  end

  def new
    @shift = Shift.new
    @users =  User.all
    @customers = Customer.all
  end

  def create
    params[:shift][:status] = params[:shift][:status].to_i
    @shift = Shift.new(shift_params)
    @users = User.all

    if @shift.user_id == ""
      @shift.user_id = User.find(params[:shift][:user_id])
    end

    if @shift.customer_id== ""
       @shift.customer_ = Customer.find(params[:shift][:customer_id])
    end
    
    respond_to do |format|
      if @shift.save
        format.js { @status = "success" }
      else
        format.js { @status = "fail" }
      end
    end
  end
  

  def show
    @shift = Shift.find(params[:id])
    @record = @shift.records
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
    params.require(:shift).permit(:start_time, :end_time, :type, :work, :user_id, :customer_id, :status)
  end



end
