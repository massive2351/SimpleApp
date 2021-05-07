class Users::ShiftsController < ApplicationController
  layout 'users'
  
  def top
    @shifts = Shift.all
    @shift_today = Shift.where("DATE(start_time) = '#{Date.today}'")
  end
  
  def index
    @shifts = Shift.all
    @shift_today = Shift.where("DATE(start_time) = '#{Date.today}'")
    @users = User.all
  end
  
  def show
    @shift = Shift.find(params[:id])
    @shifts = Shift.all
  end
  
  def about
    @shifts = Shift.includes(:user)
  end
  
  private
  def shift_params
    params.require(:shift).permit(:start_time, :end_time, :type, :work, :staff, :user_id, :customer_id, :customer_na)
  end
  
end
