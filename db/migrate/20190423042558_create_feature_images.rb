# frozen_string_literal: true

class CreateFeatureImages < ActiveRecord::Migration[5.2]
  def change
    create_table :feature_images do |t|
      t.integer :product_id
      t.string :image

      t.timestamps
    end
  end
end
