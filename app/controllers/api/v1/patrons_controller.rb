class Api::V1::PatronsController < ApplicationController
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
    patron = Patron.create(patron_params)
    broadcast('/patrons/new', {id: patron.id}) unless patron.new_record?
    respond_with patron
  end

  def update
    patron = Patron.update(params[:id], patron_params)
    broadcast('/patrons/update', {id: patron.id})
    respond_with patron
  end

  def destroy
    broadcast('/patrons/delete', {id: params[:id]})
    respond_with Patron.destroy(params[:id])
  end

  private
  def patron_params
    params.require(:patron).permit(:name, :code, :name, :gender, :email,
                                   :adult, :notes, :keep_checkout_history)
  end
end
