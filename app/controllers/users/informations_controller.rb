class Users::InformationsController < ApplicationController
  before_action :authenticate_user!
  layout 'users'
  def index
    @informations = Information.all
  end
  
end
