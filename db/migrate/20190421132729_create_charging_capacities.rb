class CreateChargingCapacities < ActiveRecord::Migration[5.2]
  def change
    create_table :charging_capacities do |t|
      t.integer :product_id
      t.string :image
      t.string :first_text
      t.string :second_text

      t.timestamps
    end
  end
end
