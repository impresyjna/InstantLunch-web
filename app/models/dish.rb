class Dish < ActiveRecord::Base
  has_many :menu_dishes
end
