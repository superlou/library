class BookSerializer < ActiveModel::Serializer
  attributes :id, :code, :title, :volume, :adult
end
