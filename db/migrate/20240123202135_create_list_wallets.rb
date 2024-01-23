class CreateListWallets < ActiveRecord::Migration[7.0]
  def change
    create_table :list_wallets do |t|
      t.references :wallet, null: false, foreign_key: true
      t.date :data
      t.float :valor
      t.string :obs
      t.timestamps
    end
  end
end
