class DashboardController < FrontController
  def index
    @orders = OrderItem.where(dish_id: Dish.where("restaurant_owner_id = ? and active = true", current_user.actable_id).pluck(:id)).last(10)
  end
end
