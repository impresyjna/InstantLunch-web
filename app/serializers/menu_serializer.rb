class MenuSerializer < ActiveModel::Serializer
  attributes :id, :menu_dishes

  def as_json(*args)
    hash = super(*args)

    hash[:menu_dishes] = {
        menu_dishes: ActiveModel::ArraySerializer.new(
            object.menu_dishes,
            each_serializer: MenuDishSerializer
        ).as_json
    }

    hash
  end

end
