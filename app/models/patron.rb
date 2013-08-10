class Patron < ActiveRecord::Base
  attr_accessible :code, :email, :gender, :name
end
