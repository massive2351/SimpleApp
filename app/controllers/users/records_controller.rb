class Users::RecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_record, only: [:show, :edit, :update]
  layout 'users'
  
  def new
    @record = Record.new
    @shift = Shift.find(params[:format])
    @min = @shift.work_time
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
      render :new
    end
  end

  def index
    #最新の順番
    @records = current_user.records.order("created_at DESC")
    @sequence = 1.step
    @record_todays = @records.record_today
  end

  def show
    @shift = @record.shift
    @min = @shift.work_time
  end

  def edit
    @shift = @record.shift
    @min = @shift.work_time
  end

  def update
    params[:record][:face] = params[:record][:face].to_i
    params[:record][:sewat] = params[:record][:sewat].to_i
    params[:record][:bath_care] = params[:record][:bath_care].to_i

    if @record.update(record_params)
      flash[:notice] = "サービスを更新しました"
      redirect_to record_path(@record)
    else
      render :edit
    end

  end

  private
  
  def find_record
    @record = Record.find(params[:id])
  end
  
  def record_params
    params.require(:record).permit(
      :shift_id, :user_id, :face, :sewat, :body_temperature, :urinate, :evacuate, :meal_care,
      :bath_care, :cooking_care, :buy_care, :content, :excretion_care => [], :move_care => [],:clean_care => [], )
  end
end

