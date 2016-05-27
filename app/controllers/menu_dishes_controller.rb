class MenuDishesController < FrontController
  def edit
    @menu_dish = MenuDish.find(params[:id])
    @dishes_categories = DishCategory.where(restaurant_owner_id: current_user.actable_id)
    @dishes_categories = @dishes_categories.pluck(:name, :id)
  end

  def update
    @menu_dish = MenuDish.find(params[:id])
    @menu = @menu_dish.menu
    if @menu_dish.update_attributes(menu_dish_params)
      flash[:success] = "Dane zaktualizowane"
      redirect_to @menu
    else
      render 'edit'
    end
  end

  def destroy
    @menu_dish = MenuDish.find(params[:id])
    @menu = @menu_dish.menu
    MenuDish.find(params[:id]).destroy
    flash[:success] = "Usunięto danie"
    redirect_to @menu
  end

  private
  def menu_dish_params
    params.require(:menu_dish).permit(:dish_id, :menu_id, :promotion, :dish_category_id)
  end
end
