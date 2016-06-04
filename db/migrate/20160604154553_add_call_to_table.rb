class AddCallToTable < ActiveRecord::Migration
  def change
    add_column :tables, :call, :boolean, default: false
  end
end
