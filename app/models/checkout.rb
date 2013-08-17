class Checkout < ActiveRecord::Base
  attr_accessible :book_id, :patron_id, :status, :closed_at, :created_at, :patron, :book

  belongs_to :book
  belongs_to :patron
  validates_presence_of :status, :book, :patron

  validates_inclusion_of :status, :in => %w[out returned lost]

  before_validation :default_values
  def default_values
    self.status ||= 'out'
  end
end
