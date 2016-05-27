class OrdersController < FrontController
  def index
    @orders = Order.where(table_id: Table.where(restaurant_id: Restaurant.where(restaurant_owner_id: current_user.actable.id).pluck(:id)).pluck(:id))
  end

  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @order }
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end


  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params[:order]
    end
end
