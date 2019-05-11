# frozen_string_literal: true

class CreateContactUs < ActiveRecord::Migration[5.2]
  def change
    create_table :contact_us do |t|
      t.string :name
      t.string :email_address
      t.text :message

      t.timestamps
    end
  end
end
