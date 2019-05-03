class FeatureImage < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :product
end
	