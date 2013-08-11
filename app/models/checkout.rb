class Checkout < ActiveRecord::Base
  attr_accessible :book_id, :patron_id, :status, :closed_at, :created_at

  belongs_to :book
  belongs_to :patron
  validates_presence_of :status, :book, :patron

  validates_inclusion_of :status, :in => %w[out returned lost]
end
