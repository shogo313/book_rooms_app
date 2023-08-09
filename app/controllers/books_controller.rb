class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_room, only: [:new, :confirm, :back]
  

  def index
    @user = User.find(params[:user_id])
    @books = @user.books
  end
  
  def new
    @book = Book.new
    @user = current_user
  end

  def confirm
    @book = Book.new(book_params.merge(user_id: current_user.id, room_id: @room.id))
    @book.number_of_nights = @book.calculate_number_of_nights
    @book.payment_amount = @book.calculate_payment_amount
    render :new if @book.invalid?
  end

  def back
    @book = Book.new(book_params)
    render :new
  end

  def create
    @book = Book.new(book_params_create)
    if @book.save
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

  def book_params
    params.require(:book).permit(:check_in_date, :check_out_date, :number_of_people)
  end

  def book_params_create
    params.require(:book).permit(:check_in_date, :check_out_date, :number_of_nights, :number_of_people, :payment_amount, :user_id, :room_id)
  end
  
end
