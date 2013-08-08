class Book < ActiveRecord::Base
  attr_accessible :adult, :code, :notes, :title, :volume

  validates_presence_of :title
end
