class Users::RecordsController < ApplicationController
  before_action :authenticate_user!
  layout 'users'
  def new
    @record = Record.new
    @shift = Shift.find(params[:format])
    @min = (@shift.end_time-@shift.start_time)/60
  end

  def create
    params[:record][:face] = params[:record][:face].to_i
    params[:record][:sewat] = params[:record][:sewat].to_i
    params[:record][:bath_care] = params[:record][:bath_care].to_i
    @record = Record.new(record_params)
    if @record.save!
      flash[:notice] = "サービスを追加しました"
      redirect_to records_path
    else
      render :index
    end
  end


  def index
    @records = current_user.records
    @sequence = 1.step
    @record_todays = @records.where("created_at >= ?", Date.today)
  end

  def show
    @record = Record.find(params[:id])
    @shift = @record.shift
    @min = (@shift.end_time-@shift.start_time)/60
  end

  def edit
    @record = Record.find(params[:id])
    @shift = @record.shift
    @min = (@shift.end_time-@shift.start_time)/60
  end

  def update
    params[:record][:face] = params[:record][:face].to_i
    params[:record][:sewat] = params[:record][:sewat].to_i
    params[:record][:bath_care] = params[:record][:bath_care].to_i

    @record = Record.find(params[:id])
    if @record.update(record_params)
      flash[:notice] = "サービスを更新しました"
      redirect_to records_path
    else
      render :index
    end

  end

  private
  def record_params
    params.require(:record).permit(
      :shift_id, :user_id, :face, :sewat, :body_temperature, :urinate, :evacuate, :meal_care,
      :bath_care, :cooking_care, :buy_care, :content, :excretion_care => [], :move_care => [],:clean_care => [], )
  end
end

