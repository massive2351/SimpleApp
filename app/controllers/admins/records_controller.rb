class Admins::RecordsController < ApplicationController
  before_action :authenticate_admin!
  before_action :find_record, only: [:show]
  layout 'admins'

  def show
    @shift = @record.shift
    
    #記録の時間を表示する為
    @min = (@shift.end_time-@shift.start_time)/60
  end
  
  private
  def find_record
    @record = Record.find(params[:id])
  end
end
