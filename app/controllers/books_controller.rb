class BooksController < ApplicationController
before_action :authenticate_user!
before_action :correct_user, only: [:edit, :update]

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @user = User.find(current_user.id)
    if @book.save
      redirect_to books_path
      flash[:success] = 'Book was successfully created.'
    else
      @books = Book.all
      render :index
    end
  end

  def show
    @book = Book.find(params[:id])
    @user = User.find(current_user.id)
    @userf = User.find_by(id: @book.user_id)
  end

  def index
  	@books = Book.all
  	@book = Book.new
    @user = User.find(current_user.id)
  end

  def edit
  	@book = Book.find(params[:id])
  	flash[:success] = 'Book was successfully created.'
  end

  def update
  	@book = Book.find(params[:id])
  	if @book.update(book_params)
  	  redirect_to book_path(book_params)
    else
      render :edit
    end
  end

  def destroy
  	book = Book.find(params[:id])
  	book.destroy
  	redirect_to books_path
  end

  def book_params
  	# params.require(:オブジェクト名).permit(:カラム名)
  	params.require(:book).permit(:title, :body, :user_id)
  end

  def correct_user
  @book = current_user.books.find_by(id: params[:id])
    unless @book
      redirect_to books_path
    end
  end
end