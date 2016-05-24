class AddOpenToRestaurant < ActiveRecord::Migration
  def change
    add_column :restaurants, :open, :boolean, default: true
  end
end
