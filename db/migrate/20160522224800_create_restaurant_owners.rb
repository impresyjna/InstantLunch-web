class CreateRestaurantOwners < ActiveRecord::Migration
  def change
    create_table :restaurant_owners do |t|
      t.string :telephone
      t.string :NIP

      t.timestamps null: false
    end
  end
end
