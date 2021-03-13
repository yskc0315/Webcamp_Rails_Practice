class BooksController < ApplicationController
  
  before_action :set_book, only:[:show, :edit, :update]
  
  def create
    book = Book.new(book_params)
    book.user_id = current_user.id
    book.save
    redirect_to books_path
  end
  
  def index
    @book = Book.new
    @books = Book.all
  end
  
  def show
    @comment = Comment.new
    @comments = Comment.where(book_id: params[:id])
  end
  
  def edit
  end
  
  def update
    @book.update(book_params)
    redirect_to books_path(params[:id])
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
  def set_book
    @book = Book.find(params[:id])
  end
  
end
