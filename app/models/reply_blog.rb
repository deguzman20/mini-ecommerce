# frozen_string_literal: true

class ReplyBlog < ApplicationRecord
  belongs_to :blog, optional: true
end
