class PatronSerializer < ActiveModel::Serializer
  attributes :id, :code, :email, :gender, :name, :notes, :adult, :keep_checkout_history
end
