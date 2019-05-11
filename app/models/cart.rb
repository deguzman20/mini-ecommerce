# frozen_string_literal: true

class Cart < ApplicationRecord
  belongs_to :customer
  has_many :cart_products
end
