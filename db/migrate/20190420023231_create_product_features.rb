class CreateProductFeatures < ActiveRecord::Migration[5.2]
  def change
    create_table :product_features do |t|
      t.string :image
      t.string :name

      t.timestamps
    end
  end
end
