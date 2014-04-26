class Api::V1::BooksController < ApplicationController
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
    book = Book.create(book_params)
    #broadcast('/books/new', {id: book.id}) unless book.new_record?
    respond_with book
  end

  def update
    book = Book.update(params[:id], book_params)
    #broadcast('/books/update', {id: book.id})
    respond_with book
  end

  def destroy
    book = Book.destroy(params[:id])
    #broadcast('/books/delete', {id: book.id})
    respond_with book
  end

  private
  def book_params
    params.require(:book).permit(:title, :subtitle, :code, :notes, :volume, :adult, :stock, :author)
  end
end
