class BookSerializer < ActiveModel::Serializer
  attributes :id, :code, :notes, :title, :subtitle, :author, :volume, :adult, :stock, :available, :created_at

  has_many :checkouts, embed: :ids
end
