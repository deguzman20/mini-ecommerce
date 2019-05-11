# frozen_string_literal: true

class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :email
      t.string :password_digest
      t.string :fullname
      t.string :role_id

      t.timestamps
    end
  end
end
