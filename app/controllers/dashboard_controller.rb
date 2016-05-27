class DashboardController < FrontController
  def index
    @orders = OrderItem.where(dish_id: Dish.where(restaurant_owner_id: current_user.actable_id).pluck(:id)).last(10)
    @favorites = FavoriteRestaurant.where(restaurant_id: Restaurant.where(restaurant_owner_id: current_user.actable_id).pluck(:id)).pluck(:customer_id).uniq.count
    @this_month = Order.where(table_id: Table.where(restaurant_id: Restaurant.where(restaurant_owner_id: current_user.actable_id).pluck(:id)).pluck(:id)).this_month.count
    @this_day = Order.where(table_id: Table.where(restaurant_id: Restaurant.where(restaurant_owner_id: current_user.actable_id).pluck(:id)).pluck(:id)).this_day.count
  end
end
