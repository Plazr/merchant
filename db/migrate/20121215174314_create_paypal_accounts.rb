class CreatePaypalAccounts < ActiveRecord::Migration
  def change
    create_table :paypal_accounts do |t|
      t.string :login
      t.string :password
      t.string :signature

      t.timestamps
    end
  end
end
