class CheckoutSerializer < ActiveModel::Serializer
  attributes :id, :status, :closed_at

  has_one :book
  has_one :patron
end