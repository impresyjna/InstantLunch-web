class OrderStatusesController < FrontController

  def index
    @order_statuses = OrderStatus.where(restaurant_owner_id: current_user.actable_id)
  end

  def show
    @order_status = OrderStatus.find(params[:id])
  end

  def new
    @order_status = OrderStatus.new
  end

  def edit
    @order_status = OrderStatus.find(params[:id])
  end

  def create
    @restaurant_owner = RestaurantOwner.find(current_user.actable_id)
    @order_status = @restaurant_owner.order_statuses.create(order_status_params)
    if @order_status.save
      flash[:success] = "Dodano status"
      redirect_to order_statuses_path
    else
      flash[:warning] = "Nie udało się dodać statusu"
      render 'new'
    end
  end

  def update
    @order_status = OrderStatus.find(params[:id])
    if @order_status.update_attributes(order_status_params)
      flash[:success] = "Dane zaktualizowane"
      redirect_to order_statuses_path
    else
      render 'edit'
    end
  end

  def destroy
  end

  private

  def order_status_params
    params.require(:order_status).permit(:name, :visible)
  end
end
