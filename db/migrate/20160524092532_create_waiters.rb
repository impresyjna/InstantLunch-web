class CreateWaiters < ActiveRecord::Migration
  def change
    create_table :waiters do |t|
      t.references :restaurant_owner, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
