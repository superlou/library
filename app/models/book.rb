class Book < ActiveRecord::Base
  validates_presence_of :title, :code
  validates_uniqueness_of :code

  has_many :checkouts
  has_many :patrons, through: :checkouts

  def available
    stock_checked_out = checkouts.select{|c| c.status == 'out'}.count

    if stock
      stock - stock_checked_out
    else
      nil
    end
  end
end
