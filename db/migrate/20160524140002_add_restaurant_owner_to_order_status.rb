class AddRestaurantOwnerToOrderStatus < ActiveRecord::Migration
  def change
    add_reference :order_statuses, :restaurant_owner, index: true, foreign_key: true
  end
end
