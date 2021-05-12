class Admins::RecordsController < ApplicationController
  before_action :authenticate_admin!
  layout 'admins'
  
  def show
    @record = Record.find(params[:id])
    @shift = @record.shift
    @min = (@shift.end_time-@shift.start_time)/60
  end
end
