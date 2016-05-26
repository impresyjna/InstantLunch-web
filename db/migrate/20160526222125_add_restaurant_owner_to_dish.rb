class AddRestaurantOwnerToDish < ActiveRecord::Migration
  def change
    add_reference :dishes, :restaurant_owner, index: true, foreign_key: true
  end
end
