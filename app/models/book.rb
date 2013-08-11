class Book < ActiveRecord::Base
  attr_accessible :adult, :code, :notes, :title, :volume, :stock

  validates_presence_of :title, :stock, :code
  validates_uniqueness_of :code

  before_save :default_values
  def default_values
    self.stock ||= 1
  end
end
