class Api::V1::FavoriteRestaurantsController < ApplicationController
  respond_to :json
  before_action :authenticate_with_token!, only: [:create, :promotions]

  def create
    favorite_restaurant = FavoriteRestaurant.new(favorite_restaurant_params)
    favorite_restaurant.customer_id = Customer.find(current_user.actable_id).id
    if favorite_restaurant.save
      render json: favorite_restaurant, status: 201
    else
      render json: { errors: favorite_restaurant.errors }, status: 422
    end
  end

  def promotions
    menu_dishes = MenuDish.where("promotion is not null and menu_id in (?)", Menu.where(restaurant_id: Customer.find(current_user.actable_id).favorite_restaurants.pluck(:restaurant_id)).pluck(:id))
    render json: menu_dishes, status: 200
  end

  private
  def favorite_restaurant_params
    params.require(:favorite_restaurant).permit(:restaurant_id)
  end

end
