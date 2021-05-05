class Users::RecordsController < ApplicationController
  def new
    @record = Record.new
    @shift = Shift.find(params[:format])
    @min = (@shift.end_time-@shift.start_time)/60
  end
end
