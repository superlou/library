class PatronsController < ApplicationController
  respond_to :json

  def index
    respond_with Patron.all
  end

  def show
    if params[:id].first(5) == 'code:'
      @patron = Patron.find_by_code(params[:id][5..-1])
    else
      @patron = Patron.find(params[:id])
    end

    respond_with @patron
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
