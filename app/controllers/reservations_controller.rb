class ReservationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_room, only: [:new, :confirm, :back]

  def index
    @reservations = current_user.reservations
  end
  
  def new
    @reservation = Reservation.new
    @user = current_user
  end

  def confirm
    @reservation = Reservation.new(reservation_params.merge(user_id: current_user.id, room_id: @room.id))
    @reservation.number_of_nights = @reservation.calculate_number_of_nights
    @reservation.payment_amount = @reservation.calculate_payment_amount
    render :new if @reservation.invalid?
  end

  def back
    @reservation = Reservation.new(reservation_params)
    render :new
  end

  def create
    @reservation = Reservation.new(reservation_params_create)
    if @reservation.save
      flash[:notice] = "宿を予約しました"
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def set_room
    @room = Room.find(params[:room_id])
  end

  def reservation_params
    params.require(:reservation).permit(:check_in_date, :check_out_date, :number_of_people)
  end

  def reservation_params_create
    params.require(:reservation).permit(:check_in_date, :check_out_date, :number_of_nights, :number_of_people, :payment_amount, :user_id, :room_id)
  end
end
