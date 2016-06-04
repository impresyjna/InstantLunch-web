class MenuSerializer < ActiveModel::Serializer
  attributes :menu, :menu_dishes

  def menu
    {
        restaurant: object.restaurant.name,
    }
  end

  def menu_dishes
    object.menu_dishes.map do |menu_dish|
      MenuDishSerializer.new(menu_dish, scope: scope, root: false, event: object)
    end
  end

end
