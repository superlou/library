class PatronsController < ApplicationController
  respond_to :json

  def index
    respond_with Patron.all
  end

  def show
    respond_with Patron.find params[:id]
  end

  def create
    respond_with Patron.create(patron_params)
  end

  def update
    respond_with Patron.update(params[:id], patron_params)
  end

  def destroy
    respond_with Patron.destroy(params[:id])
  end

  private
  def patron_params
    params.require(:patron).permit(:name, :code, :name, :gender, :email)
  end
end
