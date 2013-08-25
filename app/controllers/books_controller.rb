class BooksController < ApplicationController
  respond_to :json

  def index
    respond_with Book.order(:title).all
  end

  def show
    if params[:id].first(5) == 'code:'
      @book = Book.find_by_code(params[:id][5..-1])
    else
      @book = Book.find(params[:id])
    end

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
    params.require(:book).permit(:title, :code, :notes, :volume, :adult, :stock)
  end
end
