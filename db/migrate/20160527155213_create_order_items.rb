class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.references :order, index: true, foreign_key: true
      t.references :dish, index: true, foreign_key: true
      t.float :price

      t.timestamps null: false
    end
  end
end
