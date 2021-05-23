class Users::InformationsController < ApplicationController
  before_action :authenticate_user!
  layout 'users'
  
  def index
    #IDの大きい順番
    @informations = Information.all.order("created_at DESC")
  end
  
end
