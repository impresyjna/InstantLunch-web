class Waiter < ActiveRecord::Base
  acts_as :user
  belongs_to :restaurant_owner
  belongs_to :restaurant
end
