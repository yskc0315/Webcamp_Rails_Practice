class FavoritesController < ApplicationController
  def create
    user = current_user
    book = Book.find(params[:book_id])
    Favorite.create(user_id: user.id, book_id: book.id)
    redirect_back(fallback_location: root_path)
  end
  
  def destroy
    user = current_user
    book = Book.find(params[:book_id])
    favorite = Favorite.find_by(user_id: user.id, book_id: book.id)
    favorite.destroy
    redirect_back(fallback_location: root_path)
  end
end
