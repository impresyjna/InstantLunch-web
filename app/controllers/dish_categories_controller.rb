class DishCategoriesController < FrontController
  def index
    @dish_categories = DishCategory.where(restaurant_owner_id: current_user.actable_id)
  end

  def show
    @dish_category = DishCategory.find(params[:id])
  end

  def new
    @dish_category = DishCategory.new
  end

  def edit
    @dish_category = DishCategory.find(params[:id])
  end

  def create
    @restaurant_owner = RestaurantOwner.find(current_user.actable_id)
    @dish_category = @restaurant_owner.dish_categories.create(dish_category_params)
    if @dish_category.save
      flash[:success] = "Dodano kategorię"
      redirect_to dish_categories_path
    else
      flash[:warning] = "Nie udało się dodać kategorii"
      render 'new'
    end
  end

  def update
    @dish_category = DishCategory.find(params[:id])
    if @dish_category.update_attributes(dish_category_params)
      flash[:success] = "Dane zaktualizowane"
      redirect_to dish_categories_path
    else
      render 'edit'
    end
  end

  def destroy
  end

  private

  def dish_category_params
    params.require(:dish_category).permit(:name)
  end
end
