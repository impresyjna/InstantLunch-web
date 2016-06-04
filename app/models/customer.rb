class Customer < ActiveRecord::Base
  acts_as :user
  has_many :favorite_restaurants
end
