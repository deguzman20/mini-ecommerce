# frozen_string_literal: true

class CreateReplyBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :reply_blogs do |t|
      t.integer :blog_id
      t.text :comment
      t.string :name
      t.string :email
      t.string :website

      t.timestamps
    end
  end
end
