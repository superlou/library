class CheckoutsController < ApplicationController
  respond_to :json

  def index
    if params[:status] == 'out'
      checkouts = Checkout.where(status: 'out')
    else
      checkouts = Checkout.all
    end

    respond_with checkouts
  end

  def show
    respond_with Checkout.find(params[:id])
  end

  def create
    checkout = Checkout.create(checkout_params)
    broadcast('/checkouts/new', {id: checkout.id})
    respond_with checkout
  end

  def update
    checkout = Checkout.update(params[:id], checkout_params)
    broadcast('/checkouts/update', {id: checkout.id})
    respond_with checkout
  end

  def destroy
    checkout_id = params[:id]
    checkout = Checkout.destroy(params[:id])
    broadcast('/checkouts/delete', {id: checkout_id})
    respond_with checkout
  end

  private
  def checkout_params
    params.require(:checkout).permit(:patron_id, :book_id, :status, :closed_at, :created_at)
  end
end
