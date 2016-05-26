class RemoveMenuFromDish < ActiveRecord::Migration
  def change
    remove_reference :dishes, :menu, index: true, foreign_key: true
  end
end
