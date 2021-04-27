class Admins::ShiftsController < ApplicationController
  def index
    @shifts = Shift.all
    @shift = Shift.new
  end

  def create
    @shift = Shift.new(shift_params)
    if @shift.save!
      flash[:notice] = "新規シフト追加できました"
      redirect_to admins_shifts_path
    else
      render :index
    end
  end
  
  def start_time
    self.shift_model.start 
  end

  private
  def shift_params
    params.require(:shift).permit(:date, :start_time, :end_time, :type, :work)
  end

end
