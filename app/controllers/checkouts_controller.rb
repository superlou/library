class CheckoutsController < ApplicationController
  respond_to :json

  def index
    respond_with Checkout.all
  end

  def show
    respond_with Checkout.find(params[:id])
  end

  def create
    respond_with Checkout.create(checkout_params)
    puts checkout_params
  end

  def update
    respond_with Checkout.update(params[:id], checkout_params)
  end

  def destroy
    respond_with Checkout.destroy(params[:id])
  end

  private
  def checkout_params
    params.require(:checkout).permit(:patron_id, :book_id, :status, :closed_at)
  end
end
