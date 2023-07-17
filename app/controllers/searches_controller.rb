class SearchesController < ApplicationController
  def index
    @rooms = Room.search(params[:word_name_detail], params[:word_area])
  end

  def show
    @room = Room.find(params[:id])
  end
end
