class Admins::RecordsController < ApplicationController
  def show
    @record = Record.find(params[:id])
    @shift = @record.shift
    @min = (@shift.end_time-@shift.start_time)/60
  end
end
