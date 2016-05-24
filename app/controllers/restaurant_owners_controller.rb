class RestaurantOwnersController < FrontController
  def show

  end

  def create
    restaurant_owner = RestaurantOwner.new(restaurant_owner_params)
    if restaurant_owner.save
      restaurant_owner.generate_authentication_token!
      log_in restaurant_owner
      redirect_to dashboard_path
    else
      flash.now[:danger] = 'Niepoprawne dane'
      redirect_to root_path
    end
  end

  def edit

  end

  def update

  end

  private
  def restaurant_owner_params
    params.require(:restaurant_owner).permit(:email,:password, :password_confirmation, :login, :surname, :name, :NIP, :telephone)
  end
end
