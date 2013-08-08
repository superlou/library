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

  def create
    respond_with Book.create(book_params)
  end

  def update
    respond_with Book.update(params[:id], book_params)
  end

  def destroy
    respond_with Book.destroy(params[:id])
  end

  private
  def book_params
    params.require(:book).permit(:title, :notes, :volume, :adult)
  end
end
