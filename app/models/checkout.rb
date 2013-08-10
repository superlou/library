class Checkout < ActiveRecord::Base
  attr_accessible :book, :patron, :status, :closed_at

  belongs_to :book
  belongs_to :patron
  validates_presence_of :status, :book, :patron
end
