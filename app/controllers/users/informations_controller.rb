class Users::InformationsController < ApplicationController
  layout 'users'
  
  def index
    @informations = Information.all
  end
  
end
