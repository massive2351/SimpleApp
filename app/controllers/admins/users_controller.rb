class Admins::UsersController < ApplicationController
  before_action :authenticate_admin!
  layout 'admins'

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @shifts = @user.shifts.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
     @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admins_user_path(@user)
      flash[:notice] = "スッタフ情報を更新しました"
    else
      render :edit
    end
  end
  
  def search
    if params[:last_name].present?
      @users = User.get_by_last_name params[:last_name]
    else
      @users = User.all
    end
    render 'index'
  end

  private
  def user_params
    params.require(:user).permit(:image, :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email)
  end
end
