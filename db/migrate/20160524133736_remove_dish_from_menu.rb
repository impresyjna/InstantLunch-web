class RemoveDishFromMenu < ActiveRecord::Migration
  def change
    remove_reference :menus, :dish, index: true, foreign_key: true
  end
end
