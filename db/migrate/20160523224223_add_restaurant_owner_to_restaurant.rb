class AddRestaurantOwnerToRestaurant < ActiveRecord::Migration
  def change
    add_reference :restaurants, :restaurant_owner, index: true, foreign_key: true
  end
end
