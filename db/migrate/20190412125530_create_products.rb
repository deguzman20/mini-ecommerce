class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :image
      t.decimal :price, :precision => 8, :scale => 2
      t.text :product_description
      t.decimal :weight, :precision => 6, :scale => 2
      t.timestamps
    end
  end
end
