class OrderSerializer < ActiveModel::Serializer
  attributes :id, :total_price, :customer_id, :table_id, :order_status_id, :order_items
end
