class Api::V1::RestaurantsController < ApplicationController
  respond_to :json
  before_action :authenticate_with_token!, only: [:favorite]

  def index
    restaurants = Restaurant.where(open: true)
    render json: restaurants, status: 200
  end

  def favorite
    user = current_user
    customer = Customer.find(user.actable_id)
    favorite = customer.favorite_restaurants
    restaurants = Restaurant.where(id: favorite.pluck(:restaurant_id))
    if !restaurants.blank?
      render json: restaurants, status: 200
    else
      head 404
    end
  end


end