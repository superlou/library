class Patron < ActiveRecord::Base
  attr_accessible :code, :email, :gender, :name

  validates_presence_of :name, :code
  validates_uniqueness_of :code
end
