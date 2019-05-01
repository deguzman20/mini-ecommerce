class ReplyBlog < ApplicationRecord
  belongs_to :blog, optional: true
end
