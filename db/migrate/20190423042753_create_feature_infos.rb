# frozen_string_literal: true

class CreateFeatureInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :feature_infos do |t|
      t.integer :product_id
      t.string :image
      t.string :first_text
      t.string :second_text

      t.timestamps
    end
  end
end
