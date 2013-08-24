class Book < ActiveRecord::Base
  attr_accessible :adult, :code, :notes, :title, :volume, :stock, :created_at,
                  :subtitle, :oversized, :non_standard_size, :category, :publisher,
                  :author, :language

  validates_presence_of :title, :code
  validates_uniqueness_of :code

  has_many :checkouts
  has_many :patrons, through: :checkouts

  def available
    stock_checked_out = checkouts.select{|c| c.status == 'out'}.count
    stock - stock_checked_out
  end
end
