json.array!(@menu_dishes) do |menu_dish|
  json.extract! menu_dish, :id
  json.url menu_dish_url(menu_dish, format: :json)
end
