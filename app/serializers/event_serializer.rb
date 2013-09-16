class EventSerializer < ActiveModel::Serializer
  attributes :id, :name, :location, :start, :finish
end