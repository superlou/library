class BookSerializer < ActiveModel::Serializer
  attributes :id, :code, :notes, :title, :volume, :adult, :stock, :available

  has_many :checkouts, embed: :ids
end
