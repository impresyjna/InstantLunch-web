class RestaurantOwnersController < FrontController
  def show
    @restaurant_owner  = RestaurantOwner.find(current_user.actable_id)
    @restaurants_count = @restaurant_owner.restaurants.where(open: true).count
    @waiters_count = @restaurant_owner.waiters.count
    @dishes_count = @restaurant_owner.dishes.count
    @dish_categories_count = @restaurant_owner.dish_categories.count
  end

  def create
    restaurant_owner = RestaurantOwner.new(restaurant_owner_params)
    if restaurant_owner.save
      log_in restaurant_owner
      redirect_to dashboard_path
    else
      flash.now[:danger] = 'Niepoprawne dane'
      redirect_to root_path
    end
  end

  def edit
    @restaurant_owner = RestaurantOwner.find(params[:id])
  end

  def update
    @restaurant_owner = RestaurantOwner.find(params[:id])
    if @restaurant_owner.update_attributes(restaurant_owner_params)
      flash[:success] = "Dane zaktualizowane"
      redirect_to dashboard_path
    else
      render 'edit'
    end
  end

  private
  def restaurant_owner_params
    params.require(:restaurant_owner).permit(:email,:password, :password_confirmation, :login, :surname, :name, :NIP, :telephone)
  end
end
