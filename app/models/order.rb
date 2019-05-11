# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :customer, optional: true
  belongs_to :order_status, optional: true
  belongs_to :payment_order_status, optional: true
  belongs_to :customer_shipping_address, optional: true
  has_many :order_products
end
