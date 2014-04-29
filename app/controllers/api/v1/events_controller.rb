class Api::V1::EventsController < ApplicationController
  respond_to :json

  def index
    respond_with Event.all
  end

  def show
    respond_with Event.find(params[:id])
  end

  def create
    event = Event.create(event_params)
    broadcast('/events/new', {id: event.id}) unless event.new_record?
    respond_with :api, :v1, event
  end

  def update
    event = Event.update(params[:id], event_params)
    broadcast('/events/update', {id: event.id})
    respond_with event
  end

  def destroy
    event = Event.destroy(params[:id])
    broadcast('/events/delete', {id: event.id})
    respond_with event
  end

  private
  def event_params
    params.require(:event).permit(:name, :location, :start, :finish)
  end
end
