class Order < ActiveRecord::Base
  belongs_to :customer
  belongs_to :table

  scope :this_month, -> { where(created_at: Time.now.beginning_of_month..Time.now.end_of_month) }
  scope :this_day, -> { where(created_at: Time.now.beginning_of_day..Time.now.end_of_day) }
end
