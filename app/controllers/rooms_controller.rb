class RoomsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @rooms = @user.rooms
  end

  def show
    @room = Room.find(params[:id])
    redirect_to homes_top_path unless @room.user_id == current_user.id
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params.merge(user_id: current_user.id))
    if @room.save
      flash[:notice] = "提供する宿を新規登録しました"
      redirect_to homes_top_path
    else
      render :new
    end
  end

  private
  def room_params
    params.require(:room).permit(:name, :introduction, :charge_per_night, :detail, :address)
  end
end
