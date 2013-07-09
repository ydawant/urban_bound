class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    book = Book.find_by_title_and_author(params[:title].chomp, params[:author].chomp)
    p params[:book]
    book.nil? ? book = Book.create(:title => params[:title], :author => params[:author], :rating => params[:rating]) : book
    if AllBook.find_by_book_id_and_user_id(book.id, current_user.id).nil?
      current_user.books << book  
    end
    redirect_to user_path(current_user)
  end

  def logout
    session.clear
    redirect_to root_path
  end

  def destroy
    all_book = AllBook.find_by_book_id_and_user_id(params[:id], current_user.id)
    all_book.destroy
    redirect_to user_path(current_user)
  end

end
