class RestaurantsController < FrontController
  def index
    @restaurant_owner = RestaurantOwner.find(current_user.actable_id)
    @restaurants = @restaurant_owner.restaurants.where(open:true)
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new

  end

  def create
    @restaurant_owner = RestaurantOwner.find(current_user.actable_id)
    @restaurant = @restaurant_owner.restaurants.create(restaurant_params)
    if @restaurant.save
      flash[:success] = "Dodano restaurację. Poczekaj, aż zostanie aktywowana"
      RestaurantMailer.restaurant_email(@restaurant_owner, @restaurant).deliver_now
      redirect_to restaurants_path
    else
      flash[:warning] = "Nie udało się dodać restauracji"
      render 'new'
    end
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    if @restaurant.update_attributes(restaurant_params)
      flash[:success] = "Dane zaktualizowane"
      redirect_to restaurants_path
    else
      render 'edit'
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.open = false
    if @restaurant.save
      flash[:success] = "Pomyślnie usunięto"
      redirect_to restaurants_path
    else
      flash[:warning] = "Nie udało się usunąć"
      redirect_to restaurants_path
    end
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :street, :house_number,
                                       :apartment_number, :post_code, :city, :restaurant_owner_id)
  end

end
