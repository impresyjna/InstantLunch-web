class RestaurantOwner < ActiveRecord::Base
  acts_as :user
  has_many :restaurants
  has_many :dish_categories
  has_many :order_statuses
  has_many :waiters
  has_many :dishes
end
