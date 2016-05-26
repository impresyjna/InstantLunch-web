class DishesController < FrontController
  def index
    @dishes = Dish.where(restaurant_owner_id: current_user.actable_id)
  end

  # GET /dishes/1
  # GET /dishes/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @dish }
    end
  end

  # GET /dishes/new
  def new
    @dishes_categories = DishCategory.where(restaurant_owner_id: current_user.actable_id)
    @dishes_categories = @dishes_categories.pluck(:name, :id)
    @dish = Dish.new
  end

  # GET /dishes/1/edit
  def edit
  end

  # POST /dishes
  # POST /dishes.json
  def create
    @dish = Dish.new(dish_params)

    respond_to do |format|
      if @dish.save
        format.html { redirect_to @dish, notice: 'Dish was successfully created.' }
        format.json { render json: @dish, status: :created }
      else
        format.html { render action: 'new' }
        format.json { render json: @dish.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dishes/1
  # PATCH/PUT /dishes/1.json
  def update
    respond_to do |format|
      if @dish.update(dish_params)
        format.html { redirect_to @dish, notice: 'Dish was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @dish.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dishes/1
  # DELETE /dishes/1.json
  def destroy
    @dish.destroy
    respond_to do |format|
      format.html { redirect_to dishes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dish
      @dish = Dish.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dish_params
      params[:dish]
    end
end
