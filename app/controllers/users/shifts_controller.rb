class Users::ShiftsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_shift, only: [:show, :update]
  layout 'users'

  def top
    #simple_calenderで使用
    @shifts = Shift.all
    #モデルに定義
    @shift_todays = @shifts.shift_today
    #何個か数えてる
    @sequence = 1.step

    @informations = Information.order('created_at DESC')
    @informations_top = @informations.first(3)
  end

  def index
    @shifts = current_user.shifts
    @shift_todays = @shifts.shift_today
    @sequence = 1.step
  end

  def show
  end

  def update
    if @shift.update(shift_params)
      flash[:notice] = "サービスを更新しました"
      redirect_to shift_path(@shift)
    else
      render :index
    end
  end


  private
  
  def find_shift
    @shift = Shift.find(params[:id])
  end
  
  def shift_params
    params.require(:shift).permit(:start_time, :end_time, :type, :work, :staff, :user_id, :customer_id, :customer_na, :status)
  end

end
