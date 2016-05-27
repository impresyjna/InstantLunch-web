class RemoveDishCategoryFromDish < ActiveRecord::Migration
  def change
    remove_reference :dishes, :dish_category, index: true, foreign_key: true
  end
end
