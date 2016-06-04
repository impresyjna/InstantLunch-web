class MenuDishSerializer < ActiveModel::Serializer
  attributes :id, :dish, :promotion, :menu, :dish_category
end
