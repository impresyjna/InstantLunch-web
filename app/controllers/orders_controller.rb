class OrdersController < FrontController
  layout false, only: [:edit]

  def index
    @orders = Order.where(table_id: Table.where(restaurant_id: Restaurant.where(restaurant_owner_id: current_user.actable.id).pluck(:id)).pluck(:id))
  end

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
  end

  def edit
    @order = Order.find(params[:id])
    @order_statuses = @order.table.restaurant.restaurant_owner.order_statuses.pluck(:name, :id)
  end

  def update
    @order = Order.find(params[:id])
    @restaurant = @order.table.restaurant
    if @order.update_attributes(order_params)
      redirect_to actual_situation_path(id: @restaurant.id)
    else
      render 'edit'
    end
  end


  private

  def order_params
    params.require(:order).permit(:order_status_id)
  end
end
