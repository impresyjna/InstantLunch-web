class AddDishCategoryToMenuDish < ActiveRecord::Migration
  def change
    add_reference :menu_dishes, :dish_category, index: true, foreign_key: true
  end
end
