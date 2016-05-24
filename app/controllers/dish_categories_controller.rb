class DishCategoriesController < ApplicationController
  before_action :set_dish_category, only: [:show, :edit, :update, :destroy]

  # GET /dish_categories
  # GET /dish_categories.json
  def index
    @dish_categories = DishCategory.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @dish_categories }
    end
  end

  # GET /dish_categories/1
  # GET /dish_categories/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @dish_category }
    end
  end

  # GET /dish_categories/new
  def new
    @dish_category = DishCategory.new
  end

  # GET /dish_categories/1/edit
  def edit
  end

  # POST /dish_categories
  # POST /dish_categories.json
  def create
    @dish_category = DishCategory.new(dish_category_params)

    respond_to do |format|
      if @dish_category.save
        format.html { redirect_to @dish_category, notice: 'Dish category was successfully created.' }
        format.json { render json: @dish_category, status: :created }
      else
        format.html { render action: 'new' }
        format.json { render json: @dish_category.errors, status: :unprocessable_entity }
      end
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
    # Use callbacks to share common setup or constraints between actions.
    def set_dish_category
      @dish_category = DishCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dish_category_params
      params[:dish_category]
    end
end
