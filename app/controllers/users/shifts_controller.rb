class Users::ShiftsController < ApplicationController
  layout 'users'
  before_action :authenticate_user!

  def top
    @shifts = Shift.all
    @shift_today = Shift.where("DATE(start_time) = '#{Date.today}'")
    @sequence = 1.step
    @users = User.all
    
    @informations = Information.order('created_at DESC')
    @informations_top = @informations.first(3)
  end

  def index
    @shifts = current_user.shifts
    @shift_today = @shifts.where("DATE(start_time) = '#{Date.today}'")
    @users = User.all
  end

  def show
    @shift = Shift.find(params[:id])
    @shifts = Shift.all
  end
  
  def update
    @shift = Shift.find(params[:id])
    if @shift.update(shift_params)
      flash[:notice] = "サービスを更新しました"
      redirect_to shift_path(@shift)
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
