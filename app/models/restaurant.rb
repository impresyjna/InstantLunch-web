class Restaurant < ActiveRecord::Base
  belongs_to :restaurant_owner
  has_many :waiters
  has_one :menu
  has_many :tables

end
