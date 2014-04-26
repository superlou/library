class Checkout < ActiveRecord::Base
  belongs_to :book
  belongs_to :patron
  validates_presence_of :status, :book, :patron

  validates_inclusion_of :status, :in => %w[out returned lost]

  before_validation :default_values
  def default_values
    self.status ||= 'out'
  end

  def closed?
    if ['returned', 'lost'].include? status
      return true
    else
      return false
    end
  end

  after_save :protect_checkout_privacy
  def protect_checkout_privacy
    unless patron.keep_checkout_history?
      self.destroy if closed?
    end
  end
end
