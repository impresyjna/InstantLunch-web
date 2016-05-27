class AddPromotionToMenuDish < ActiveRecord::Migration
  def change
    add_column :menu_dishes, :promotion, :float
  end
end
