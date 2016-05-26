class WaitersController < FrontController

  def index
    @waiters = Waiter.where(restaurant_owner_id: current_user.actable_id)
  end

  def show
    @waiters = Waiter.find(params[:id])
  end

  def new
    @waiter = Waiter.new
    @restaurant_owner = RestaurantOwner.find(current_user.actable_id)
    @restaurants = @restaurant_owner.restaurants.where(open:true)
    @restaurants = @restaurants.pluck(:name, :id)
  end

  def edit
    @waiter = Waiter.find(params[:id])
    @restaurant_owner = RestaurantOwner.find(current_user.actable_id)
    @restaurants = @restaurant_owner.restaurants.where(open:true)
    @restaurants = @restaurants.pluck(:name, :id)
  end

  def create
    @restaurant_owner = RestaurantOwner.find(current_user.actable_id)
    @waiter = @restaurant_owner.waiters.create(waiter_params)
    if @waiter.save
      flash[:success] = "Dodano kelnera"
      redirect_to waiters_path
    else
      flash[:warning] = "Nie udało się dodać kelnera"
      render 'new'
    end
  end

  def update
    @waiter = Waiter.find(params[:id])
    if @waiter.update_attributes(waiter_params)
      flash[:success] = "Dane zaktualizowane"
      redirect_to waiters_path
    else
      render 'edit'
    end
  end

  def destroy
  end

  private

  def waiter_params
    params.require(:waiter).permit(:name, :login, :email, :surname, :password, :password_confirmation, :telephone, :restaurant_id)
  end

end
