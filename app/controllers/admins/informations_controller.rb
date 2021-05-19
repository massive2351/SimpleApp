class Admins::InformationsController < ApplicationController
  before_action :authenticate_admin!
  layout 'admins'

  def create
    @informations = Information.all
    Information.create(information_params)
    
  end

  def index
    @information = Information.new
    @informations = Information.all
  end

  def edit
    @information = Information.find(params[:id])
  end

  def update
    @information = Information.find(params[:id])
    if @information.update(information_params)
      redirect_to admins_informations_path
      flash[:notice] = "連絡事項を更新しました"
    else
      render :show
    end
  end
  
  def destroy
    @information = Information.find(params[:id])
    @information.destroy
    redirect_to admins_informations_path
    flash[:notice] = "連絡事項を消去しました"
  end

  private
  def information_params
    params.require(:information).permit(:title, :body)
  end
end
