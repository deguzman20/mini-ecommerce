# frozen_string_literal: true

class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_shipping_address_id
      t.integer :customer_id
      t.integer :order_status_id
      t.string  :paypal_transaction
      t.integer :payment_order_status_id
      t.string  :total, precision: 50, scale: 6, default: '0.0'
      t.timestamps
    end
  end
end
