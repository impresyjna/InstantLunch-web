class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :street
      t.string :house_number
      t.integer :apartment_number
      t.string :post_code
      t.string :city
      t.boolean :active

      t.timestamps null: false
    end
  end
end
