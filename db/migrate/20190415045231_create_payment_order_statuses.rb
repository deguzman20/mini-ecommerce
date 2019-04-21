class CreatePaymentOrderStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :payment_order_statuses do |t|
      t.string :name

      t.timestamps
    end
  end
end
