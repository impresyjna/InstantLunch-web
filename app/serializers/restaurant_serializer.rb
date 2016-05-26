class RestaurantSerializer < ActiveModel::Serializer
  attributes :id, :name, :street, :house_number, :apartment_number, :post_code, :city
end
