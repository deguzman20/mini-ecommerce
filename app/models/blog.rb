class Blog < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_many :reply_blogs
end
