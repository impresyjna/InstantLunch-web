class SessionsController < FrontController
  def create
    user_password = params[:session][:password]
    user_login = params[:session][:login]

    user = user_login.present? && User.find_by(login: user_login)


    if user.present?  and user.valid_password? user_password and user.actable_type == "RestaurantOwner"
      log_in user
      redirect_to dashboard_path
    elsif user.present?  and user.valid_password? user_password and user.actable_type == "Waiter"
      log_in user
      waiter = Waiter.find(user.actable_id)
      redirect_to actual_situation_path(id: waiter.restaurant_id)
    else
      flash.now[:danger] = 'Niepoprawne dane'
      redirect_to root_path
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
