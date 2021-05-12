class Users::InformationsController < ApplicationController
  layout 'users'
  before_action :authenticate_user!
  def index
    @informations = Information.all
  end
  
end
