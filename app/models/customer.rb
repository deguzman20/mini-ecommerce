class Customer < ApplicationRecord
  has_secure_password
  has_many :orders
  has_one :cart
  has_many :customer_shipping_address
end
