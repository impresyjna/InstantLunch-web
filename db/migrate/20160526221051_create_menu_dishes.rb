class CreateMenuDishes < ActiveRecord::Migration
  def change
    create_table :menu_dishes do |t|
      t.references :dish, index: true, foreign_key: true
      t.references :menu, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
