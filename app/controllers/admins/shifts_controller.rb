class Admins::ShiftsController < ApplicationController
  before_action :authenticate_admin!
  before_action :find_shift, only: [:show, :edit, :update]
  layout 'admins'

  def index
    @shifts = Shift.all
    @users = User.all
    @customers = Customer.all
    @shift = Shift.new
    @sequence = 1.step
  end


  def create
    params[:shift][:status] = params[:shift][:status].to_i
    @shift = Shift.new(shift_params)
    @shifts = Shift.order(:start_time)

    @users = User.all

    if @shift.user_id == ""
      @shift.user_id = User.find(params[:shift][:user_id])
    end

    if @shift.customer_id== ""
       @shift.customer_ = Customer.find(params[:shift][:customer_id])
    end

    #新規投稿の非同期
    respond_to do |format|
      if @shift.save
        format.js { @status = "success" }
      else
        format.js { @status = "fail" }
      end
    end
  end


  def show
    @record = @shift.record
  end

  def edit
    @users =  User.all
    @customers = Customer.all
  end

  def update

    @shift.staff = User.find(params[:shift][:user_id]).last_name
    @shift.customer_na = Customer.find(params[:shift][:customer_id]).last_name
    if @shift.update(shift_params)
      redirect_to admins_root_path
      flash[:notice] = "シフトを更新しました"
    else
      render :index
    end

  end

  private

  def find_shift
    @shift = Shift.find(params[:id])
  end

  def shift_params
    params.require(:shift).permit(:start_time, :end_time, :type, :work, :user_id, :customer_id, :status)
  end

end
