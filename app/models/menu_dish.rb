class MenuDish < ActiveRecord::Base
  belongs_to :dish
  belongs_to :menu
end
