class AddRestaurantOwnerToDishCategory < ActiveRecord::Migration
  def change
    add_reference :dish_categories, :restaurant_owner, index: true, foreign_key: true
  end
end
