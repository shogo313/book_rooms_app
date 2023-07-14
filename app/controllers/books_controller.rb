class BooksController < ApplicationController
  before_action :authenticate_user!
  

  def index
    @user = User.find(params[:user_id])
    @books = @user.books
  end
  
  def new
    @room = Room.find(params[:room_id])
    @book = Book.new
    @user = current_user
  end

  def confirm
    @room = Room.find(params[:room_id])
    @book = Book.new(params.require(:book).permit(:check_in_date, :check_out_date, :number_of_people))
    @book.user_id = current_user.id
    @book.room_id = @room.id
    @book.number_of_nights = @book.calculate_number_of_nights
    @book.payment_amount = @book.calculate_payment_amount
    render :new if @book.invalid?
  end

  def back
    @room = Room.find(params[:room_id])
    @book = Book.new(params.require(:book).permit(:check_in_date, :check_out_date, :number_of_people))
    render :new
  end

  def create
    @book = Book.new(book_params)
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
