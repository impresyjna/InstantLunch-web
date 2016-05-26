class AddRestaurantToTable < ActiveRecord::Migration
  def change
    add_reference :tables, :restaurant, index: true, foreign_key: true
  end
end
