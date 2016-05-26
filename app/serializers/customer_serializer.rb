class CustomerSerializer < ActiveModel::Serializer
  attributes :id, :login, :name, :surname, :email, :auth_token
end
