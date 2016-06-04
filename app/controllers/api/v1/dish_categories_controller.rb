class Api::V1::DishCategoriesController < ApplicationController
  respond_to :json

  def index
    dish_categories = DishCategory.all
    render json: dish_categories, status: 200
  end
end
