class CreateWallets < ActiveRecord::Migration[7.0]
  def change
    create_table :wallets do |t|
      t.references :user, foreign_key: true
      t.float :balance
      t.float :reforco
      t.date :data

      t.timestamps
    end
  end
end
