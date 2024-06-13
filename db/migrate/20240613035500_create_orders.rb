class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.integer :book_id
      t.integer :count
      t.text :adress

      t.timestamps
    end
  end
end
