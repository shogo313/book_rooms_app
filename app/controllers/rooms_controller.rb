class RoomsController < ApplicationController
  before_action :authenticate_user!

  def index
    @room = Room.where(user_id: current_user)
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(params.require(:room).permit(:name, :introduction, :charge_per_night, :detail, :address))
    @room.user_id = current_user.id
    if @room.save
      flash[:notice] = "提供する宿を新規登録しました"
      redirect_to homes_top_path
    else
      render :new
    end
  end
end
