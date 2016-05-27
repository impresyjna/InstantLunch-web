class TablesController < FrontController
  layout false, only: [:generate_qr_code]
  def index
    @restaurant_owner = RestaurantOwner.find(current_user.actable_id)
    @tables = Table.where(restaurant_id: (@restaurant_owner.restaurants.pluck(:id)))
    @tables = @tables.order(:restaurant_id)
  end

  def new
    @table = Table.new
    @restaurant_owner = RestaurantOwner.find(current_user.actable_id)
    @restaurants = @restaurant_owner.restaurants.where(open:true)
    @restaurants = @restaurants.pluck(:name, :id)
  end

  def create
    @restaurant = Restaurant.find(params[:table][:restaurant_id])
    @table = @restaurant.tables.create(table_params)
    @table.number = @restaurant.tables.count
    @table.QR_code = @table.restaurant.restaurant_owner_id.to_s + "_" + @table.restaurant_id.to_s + "_" + @table.number.to_s
    if @table.save
      flash[:success] = "Dodano stolik"
      redirect_to tables_path
    else
      flash[:warning] = "Nie udało się dodać stolika"
      render 'new'
    end
  end

  def generate_qr_code
    @table = Table.find(params[:id])
    @qr = RQRCode::QRCode.new( @table.QR_code, size: 4)
    #flash[:success] = "QR" + params[:id].to_s
    #edirect_to tables_path
  end

  def index_of_actual_situation
    @restaurant_owner = RestaurantOwner.find(current_user.actable_id)
    @restaurants = @restaurant_owner.restaurants.where(open:true)
  end

  def actual_situation

  end

  def destroy
    Table.find(params[:id]).destroy
    flash[:success] = "Usunięto stolik"
    redirect_to tables_path
  end

  private
    def table_params
      params.require(:table).permit(:restaurant_id)
    end
end
