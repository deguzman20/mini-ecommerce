class CreateCustomerShippingAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :customer_shipping_addresses do |t|
      t.integer :customer_id
      t.text :address
      t.string :apartment
      t.string :city
      t.string :country
      t.string :postal_code
      t.boolean :is_save_info
      t.timestamps
    end
  end
end
