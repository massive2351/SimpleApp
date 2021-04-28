class Admins::ShiftsController < ApplicationController
  
  def index
    @shifts = Shift.all
  end
  
  def new
    @shift = Shift.new
  end

  def create
    @shift = Shift.new(shift_params)
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
    @shift = Shift.find(params[:id])
  end
  
  def update
    @shift = Shift.find(params[:id])
    if @shift.update(shift_params)
      redirect_to admins_root_path
      flash[:notice] = "シフトを更新しました"
    else
      render :index
    end
  end
  

  private
  def shift_params
    params.require(:shift).permit(:start_time, :end_time, :type, :work)
  end

end
