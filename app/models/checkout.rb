class Checkout < ActiveRecord::Base
  attr_accessible :book_id, :patron_id, :status, :closed_at

  belongs_to :book
  belongs_to :patron
  validates_presence_of :status, :book, :patron
end
