class MenuDish < ActiveRecord::Base
  belongs_to :dish
  belongs_to :menu
  belongs_to :dish_category
end
