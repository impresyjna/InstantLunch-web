class AddDishCategoryToDish < ActiveRecord::Migration
  def change
    add_reference :dishes, :dish_category, index: true, foreign_key: true
  end
end
