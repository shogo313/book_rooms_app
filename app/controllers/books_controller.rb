class BooksController < ApplicationController
  before_action :authenticate_user!
  

  def index
  end
  
  def new
    @room = Room.find(params[:room_id])
    @book = Book.new
    @user = current_user
  end

  def confirm
    @room = Room.find(params[:room_id])
    @book = Book.new(book_params)
    @book.number_of_nights = @book.calculate_number_of_nights
    @book.payment_amount = @book.calculate_payment_amount(@room.charge_per_night)
  end

  def create
    binding.pry
    @book = Book.new(book_params)
    binding.pry
    if @book.save
      flash[:notice] = "宿を予約しました"
      redirect_to homes_top_path
    else
      render :new
    end
  end

  private
  def book_params
    params.require(:book).permit(:check_in_date, :check_out_date, :number_of_nights, :number_of_people, :payment_amount, :user_id, :room_id)
  end
  
end
