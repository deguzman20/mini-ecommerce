class ProductFeature < ApplicationRecord
  mount_uploader :image, ImageUploader
end
