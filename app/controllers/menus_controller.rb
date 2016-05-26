class MenusController < FrontController
  def index
    @restaurant_owner = RestaurantOwner.find(current_user.actable_id)
    @menus = Menu.where(restaurant_id: (@restaurant_owner.restaurants.pluck(:id)))
    @menus = @menus.order(:restaurant_id)
  end

  def new
    @menu = Menu.new
    @restaurant_owner = RestaurantOwner.find(current_user.actable_id)
    @restaurants = @restaurant_owner.restaurants.where(open:true)
    @restaurants = @restaurants.pluck(:name, :id)
  end

  def create
    @menu = Menu.new(menu_params)
    if @menu.save
      flash[:success] = "Dodano menu"
      redirect_to menus_path
    else
      flash[:warning] = "Nie udało się dodać menu"
      render 'new'
    end
  end

  def edit
    @menu = Menu.find(params[:id])
  end

  def update
    respond_to do |format|
      if @menu.update(menu_params)
        format.html { redirect_to @menu, notice: 'Menu was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end


  private

  def menu_params
    params.require(:menu).permit(:restaurant_id)
  end
end
