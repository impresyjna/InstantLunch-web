class MenuSerializer < ActiveModel::Serializer
  attributes :menu

  def menu
    {
        restaurant: object.restaurant.name,
        menu_dishes: object.menu_dishes.as_json
    }
  end

end
