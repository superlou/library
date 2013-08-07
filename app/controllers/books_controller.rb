class BooksController < ApplicationController
  respond_to :json

  def index
    @books = Book.all
    respond_with @books
  end

  def show
    @book = Book.find params[:id]
    respond_with @book
  end
end
