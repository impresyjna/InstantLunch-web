class MenusController < FrontController
  def index
    @restaurant_owner = RestaurantOwner.find(current_user.actable_id)
    @menus = Menu.where(restaurant_id: (@restaurant_owner.restaurants.pluck(:id)))
    @menus = @menus.order(:restaurant_id)
  end

  def show
    @menu = Menu.find(params[:id])
    @menu_dishes = @menu.menu_dishes.order(:dish_category_id)
    @minimum_dish_category = @menu_dishes.minimum(:dish_category_id)
    if @minimum_dish_category.blank?
      @minimum_dish_category = 0
    end
    @dishes_categories = DishCategory.where(restaurant_owner_id: current_user.actable_id)
    @dishes_categories = @dishes_categories.pluck(:name, :id)
    @dishes = Dish.where(restaurant_owner_id: current_user.actable_id)
    @dishes = @dishes.where(active: true).pluck(:name, :id)
  end

  def new
    @menu = Menu.new
    @restaurant_owner = RestaurantOwner.find(current_user.actable_id)
    @restaurants = @restaurant_owner.restaurants.where(open: true)
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

  def add_dish
    @menu_dish = MenuDish.new(menu_dish_params)
    if @menu_dish.save
      flash[:success] = "Dodano danie"
      redirect_to @menu_dish.menu
    else
      flash[:warning] = "Nie udało się dodać dania"
      redirect_to @menu_dish.menu
    end
  end


  private

  def menu_dish_params
    params.require(:menu_dish).permit(:dish_id, :menu_id, :promotion, :dish_category_id)
  end

  def menu_params
    params.require(:menu).permit(:restaurant_id)
  end
end
