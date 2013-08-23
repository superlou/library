class CheckoutSerializer < ActiveModel::Serializer
  attributes :id, :status, :created_at, :closed_at

  has_one :book, embed: :ids
  has_one :patron, embed: :ids
end