class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price
      t.text :description
      t.references :category

      t.timestamps
    end
    add_index :products, :category_id
  end
end
