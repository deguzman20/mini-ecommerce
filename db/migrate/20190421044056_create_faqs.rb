class CreateFaqs < ActiveRecord::Migration[5.2]
  def change
    create_table :faqs do |t|
      t.integer :product_id
      t.string :question
      t.text :answer

      t.timestamps
    end
  end
end
