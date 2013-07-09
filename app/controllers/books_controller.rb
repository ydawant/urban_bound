class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    book = Book.find_by_title_and_author(params[:title], params[:author])
    p params[:book]
    book.nil? ? book = Book.create(:title => params[:title], :author => params[:author]) : book
    current_user.books << book
    redirect_to user_path(current_user)
  end

  def logout
    session.clear
    redirect_to root_path
  end

end
