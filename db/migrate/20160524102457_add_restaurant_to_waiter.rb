class AddRestaurantToWaiter < ActiveRecord::Migration
  def change
    add_reference :waiters, :restaurant, index: true, foreign_key: true
  end
end
