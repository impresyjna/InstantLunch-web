class CreateTables < ActiveRecord::Migration
  def change
    create_table :tables do |t|
      t.string :QR_code

      t.timestamps null: false
    end
  end
end
