class CreateFavoriteRestaurants < ActiveRecord::Migration
  def change
    create_table :favorite_restaurants do |t|
      t.references :customer, index: true, foreign_key: true
      t.references :restaurant, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
