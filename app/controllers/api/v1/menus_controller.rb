class Api::V1::MenusController < ApplicationController
  respond_to :json

  def restaurant_menu
    menu = Menu.where(restaurant_id: params[:id])
    render json: menu, status: 200
  end
end
