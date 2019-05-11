# frozen_string_literal: true

class CreateTechnicalSpecifications < ActiveRecord::Migration[5.2]
  def change
    create_table :technical_specifications do |t|
      t.integer :product_id
      t.string :type_name
      t.string :value

      t.timestamps
    end
  end
end
