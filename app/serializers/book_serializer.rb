class BookSerializer < ActiveModel::Serializer
  attributes :id, :code, :notes, :title, :volume, :adult, :stock
end
