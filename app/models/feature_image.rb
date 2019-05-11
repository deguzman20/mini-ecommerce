# frozen_string_literal: true

class FeatureImage < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :product, optional: true
end
