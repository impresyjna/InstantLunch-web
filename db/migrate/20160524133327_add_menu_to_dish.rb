class AddMenuToDish < ActiveRecord::Migration
  def change
    add_reference :dishes, :menu, index: true, foreign_key: true
  end
end
