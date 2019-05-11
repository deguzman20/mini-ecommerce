# frozen_string_literal: true

class Blog < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_many :reply_blogs
end
