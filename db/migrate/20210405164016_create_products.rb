class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price
      t.float :tax_in_percentage

      t.timestamps
    end
  end
end
