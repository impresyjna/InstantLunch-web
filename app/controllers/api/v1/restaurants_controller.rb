class Api::V1::RestaurantsController < ApplicationController
  def index
    restaurants = Restaurant.where(open: true)
    render json: restaurants, status: 200
  end

end