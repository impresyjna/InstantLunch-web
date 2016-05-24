json.array!(@dish_categories) do |dish_category|
  json.extract! dish_category, :id
  json.url dish_category_url(dish_category, format: :json)
end
