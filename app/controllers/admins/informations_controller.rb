class Admins::InformationsController < ApplicationController
  before_action :authenticate_admin!
  before_action :find_information, only: [:edit, :update, :destroy]
  layout 'admins'

  def create
    @informations = Information.all
    @information = Information.new(information_params)
    
    #新規投稿非同期
    respond_to do |format|
      if @information.save
        format.js { @status = "success" }
      else
        format.js { @status = "fail" }
      end
    end
    
  end

  def index
    @information = Information.new
    @informations = Information.all.order("created_at DESC")
  end

  def edit
  end

  def update
    if @information.update(information_params)
      redirect_to admins_informations_path
      flash[:notice] = "連絡事項を更新しました"
    else
      render :show
    end
  end
  
  def destroy
    @information.destroy
    redirect_to admins_informations_path
    flash[:notice] = "連絡事項を消去しました"
  end

  private
  def find_information
    @information = Information.find(params[:id])
  end
  
  def information_params
    params.require(:information).permit(:title, :body)
  end
end
