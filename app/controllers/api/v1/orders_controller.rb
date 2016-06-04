class Api::V1::OrdersController < ApplicationController
  respond_to :json
  before_action :authenticate_with_token!, only: [:create]

  def create
    order = Order.new(order_params)
    order.customer_id = Customer.find(current_user.actable_id).id
    if order.save
      render json: order, status: 201, location: [:api, order]
    else
      render json: { errors: order.errors }, status: 422
    end
  end

  private
  def order_params
    params.require(:order).permit(:total_price, :customer_id, :table_id, :order_status_id, order_items_attributes: [:id, :dish_id, :price])
  end
end
