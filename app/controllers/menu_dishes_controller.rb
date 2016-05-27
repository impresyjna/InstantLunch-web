class MenuDishesController < ApplicationController
  before_action :set_menu_dish, only: [:show, :edit, :update, :destroy]

  # GET /menu_dishes
  # GET /menu_dishes.json
  def index
    @menu_dishes = MenuDish.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @menu_dishes }
    end
  end

  # GET /menu_dishes/1
  # GET /menu_dishes/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @menu_dish }
    end
  end

  # GET /menu_dishes/new
  def new
    @menu_dish = MenuDish.new
  end

  # GET /menu_dishes/1/edit
  def edit
  end

  # POST /menu_dishes
  # POST /menu_dishes.json
  def create
    @menu_dish = MenuDish.new(menu_dish_params)

    respond_to do |format|
      if @menu_dish.save
        format.html { redirect_to @menu_dish, notice: 'Menu dish was successfully created.' }
        format.json { render json: @menu_dish, status: :created }
      else
        format.html { render action: 'new' }
        format.json { render json: @menu_dish.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /menu_dishes/1
  # PATCH/PUT /menu_dishes/1.json
  def update
    respond_to do |format|
      if @menu_dish.update(menu_dish_params)
        format.html { redirect_to @menu_dish, notice: 'Menu dish was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @menu_dish.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /menu_dishes/1
  # DELETE /menu_dishes/1.json
  def destroy
    @menu_dish.destroy
    respond_to do |format|
      format.html { redirect_to menu_dishes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_menu_dish
      @menu_dish = MenuDish.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def menu_dish_params
      params[:menu_dish]
    end
end
