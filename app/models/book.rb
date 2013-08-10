class Book < ActiveRecord::Base
  attr_accessible :adult, :code, :notes, :title, :volume, :stock

  validates_presence_of :title
  validates_presence_of :stock

  before_save :default_values
  def default_values
    self.stock ||= 1
  end
end
