# frozen_string_literal: true

class ProductFeature < ApplicationRecord
  mount_uploader :image, ImageUploader
  # belongs_to :product
end
