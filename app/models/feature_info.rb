class FeatureInfo < ApplicationRecord
  belongs_to :product
  #mount_uploader :image, ImageUploader
end
