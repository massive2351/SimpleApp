class Users::RecordsController < ApplicationController
  layout 'users'
  def new
    @record = Record.new
    @shift = Shift.find(params[:format])
    @min = (@shift.end_time-@shift.start_time)/60
  end

  def create
    @record = Record.new(record_params)
    if @record.save!
      flash[:notice] = "サービスを追加しました"
      redirect_to records_path
    else
      render :index
    end

  end


  def index
    @records = Record.includes(:user)
    @record_todays = Record.where("created_at >= ?", Date.today).includes(:user)
  end
  
  def show
    @record = Record.find(params[:id])
    @shift = @record.shift
    @min = (@shift.end_time-@shift.start_time)/60
  end

  private
  def record_params
    params.require(:record).permit(
      :shift_id, :user_id, :face, :sewat, :body_temperature, :urinate, :evacuate, :meal_care,
      :bath_care, :cooking_care, :buy_care, :content, :excretion_care => [], :move_care => [],:clean_care => [], )
  end
end

