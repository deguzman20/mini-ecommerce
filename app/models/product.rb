# frozen_string_literal: true

class Product < ApplicationRecord
  has_many :cart_products
  mount_uploader :image, ImageUploader
  has_many :faqs
  has_many :technical_specifications
  has_one :technical_specification_image
  has_many :charging_capacity
  has_many :feature_images
  has_many :order_products
  # has_one :feature_produc
  # has_one :product_feature
  has_many :feature_infos
  # has_one :product
end
