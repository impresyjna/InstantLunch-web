class DishCategoriesController < FrontController
  before_action :set_dish_category, only: [:show, :edit, :update, :destroy]

  def index
    @dish_categories = DishCategory.where(restaurant_owner_id: current_user.actable_id)
  end

  # GET /dish_categories/1
  # GET /dish_categories/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @dish_category }
    end
  end

  def new
    @dish_category = DishCategory.new
  end

  # GET /dish_categories/1/edit
  def edit
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

  # PATCH/PUT /dish_categories/1
  # PATCH/PUT /dish_categories/1.json
  def update
    respond_to do |format|
      if @dish_category.update(dish_category_params)
        format.html { redirect_to @dish_category, notice: 'Dish category was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @dish_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dish_categories/1
  # DELETE /dish_categories/1.json
  def destroy
    @dish_category.destroy
    respond_to do |format|
      format.html { redirect_to dish_categories_url }
      format.json { head :no_content }
    end
  end

  private

  def dish_category_params
    params.require(:dish_category).permit(:name)
  end
end
