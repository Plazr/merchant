class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :cart
      t.string :ip_address
      t.string :first_name
      t.string :last_name
      t.string :card_type
      t.date :card_expires_on

      t.timestamps
    end
    add_index :orders, :cart_id
  end
end
