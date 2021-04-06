class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      t.belongs_to :order, null: false, foreign_key: true
      t.belongs_to :product, null: false, foreign_key: true
      t.integer :quantity
      t.decimal :total_price
      t.decimal :total_amount
      t.decimal :total_tax

      t.timestamps
    end
  end
end
