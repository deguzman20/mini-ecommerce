class Product < ApplicationRecord
 has_many :cart_products
 mount_uploader :image, ImageUploader
 has_many :faqs
 has_many :technical_specifications
 has_one :technical_specification_image
end
