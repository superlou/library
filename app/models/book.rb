class Book < ActiveRecord::Base
  attr_accessible :adult, :code, :notes, :title, :volume
end
