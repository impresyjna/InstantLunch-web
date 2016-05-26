class AddTelephoneToWaiter < ActiveRecord::Migration
  def change
    add_column :waiters, :telephone, :string
  end
end
