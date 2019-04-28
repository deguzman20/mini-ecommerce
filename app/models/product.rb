class Product < ApplicationRecord
  has_many :cart_products
  mount_uploader :image, ImageUploader
  has_many :faqs
  has_many :technical_specifications
  has_one :technical_specification_image
  has_many :charging_capacity
  has_one :feature_product
  has_many :feature_infos
  has_one :product
end
	