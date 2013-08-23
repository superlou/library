class CheckoutSerializer < ActiveModel::Serializer
  attributes :id, :status, :created_at, :closed_at

  has_one :book, embed: :object
  has_one :patron, embed: :object
end