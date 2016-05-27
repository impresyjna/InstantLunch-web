class AddVisibileInDashboardToOrderStatus < ActiveRecord::Migration
  def change
    add_column :order_statuses, :visible, :boolean, default: true
  end
end
