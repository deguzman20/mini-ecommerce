class CreateWallOfPowers < ActiveRecord::Migration[5.2]
  def change
    create_table :wall_of_powers do |t|
      t.string :image
      t.string :name
      t.string :title
      t.string :owner_product

      t.timestamps
    end
  end
end
