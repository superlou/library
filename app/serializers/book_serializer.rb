class BookSerializer < ActiveModel::Serializer
  attributes :id, :code, :notes, :title, :volume, :adult, :stock, :available, :created_at

  has_many :checkouts, embed: :ids
end
