class Event < ActiveRecord::Base
  attr_accessible :finish, :location, :name, :start

  validates_presence_of :name, :start, :finish
end
