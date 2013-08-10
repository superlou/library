class CheckoutSerializer < ActiveModel::Serializer
  attributes :id, :status, :closed_at

  has_one :book, embed: :ids
  has_one :patron, embed: :ids
end