class PatronSerializer < ActiveModel::Serializer
  attributes :id, :code, :email, :gender, :name, :notes, :adult
end
