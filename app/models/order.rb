class Order < ApplicationRecord
  belongs_to :customer, optional: true
  belongs_to :order_status, optional: true
  belongs_to :payment_order_status
end
