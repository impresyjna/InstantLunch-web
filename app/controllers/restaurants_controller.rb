class RestaurantsController < FrontController
  def index
    @restaurant_owner = RestaurantOwner.find(current_user.actable_id)
    @restaurants = @restaurant_owner.restaurants
  end

  def show

  end

  def new
    @restaurant = Restaurant.new

  end

  def create
    @restaurant_owner = RestaurantOwner.find(current_user.actable_id)
    @restaurant = @restaurant_owner.restaurants.create(restaurant_params)
    if @restaurant.save
      flash[:success] = "Dodano restaurację. Poczekaj, aż zostanie aktywowana"
      RestaurantMailer.restaurant_email(@restaurant_owner).deliver_now
      redirect_to restaurants_path
    else
      flash[:warning] = "Nie udało się dodać restauracji"
      render 'new'
    end
  end

  def edit
  end

  def update

  end

  def destroy

  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :street, :house_number,
                                 :apartment_number, :post_code, :city, :restaurant_owner_id)
  end

end
