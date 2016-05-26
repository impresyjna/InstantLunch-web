class AddActiveToDish < ActiveRecord::Migration
  def change
    add_column :dishes, :active, :boolean, default: true
  end
end
