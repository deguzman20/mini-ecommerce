# frozen_string_literal: true

class ChargingCapacity < ApplicationRecord
  belongs_to :product, optional: true
  mount_uploader :image, ImageUploader
end
