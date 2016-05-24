class RestaurantOwner < ActiveRecord::Base
  acts_as :user
  has_many :restaurants
end
