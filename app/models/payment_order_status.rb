# frozen_string_literal: true

class PaymentOrderStatus < ApplicationRecord
  has_many :orders
end
