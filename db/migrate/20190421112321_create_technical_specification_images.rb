# frozen_string_literal: true

class CreateTechnicalSpecificationImages < ActiveRecord::Migration[5.2]
  def change
    create_table :technical_specification_images do |t|
      t.integer :product_id
      t.string :image

      t.timestamps
    end
  end
end
