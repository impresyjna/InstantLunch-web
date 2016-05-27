class Order < ActiveRecord::Base
  belongs_to :customer
  belongs_to :table
  belongs_to :order_status
  has_many :order_items

  scope :this_month, -> { where(created_at: Time.now.beginning_of_month..Time.now.end_of_month) }
  scope :this_day, -> { where(created_at: Time.now.beginning_of_day..Time.now.end_of_day) }
end
