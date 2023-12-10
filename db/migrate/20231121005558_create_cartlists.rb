class CreateCartlists < ActiveRecord::Migration[7.0]
  def change
    create_table :cartlists do |t|
      t.float :valor
      t.integer :forma_de_pagamento
      t.references :cliente,foreign_key: true
      t.timestamps
    end
  end
end
