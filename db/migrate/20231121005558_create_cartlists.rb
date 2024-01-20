class CreateCartlists < ActiveRecord::Migration[7.0]
  def change
    create_table :cartlists do |t|
      t.float :valor
      t.integer :forma_de_pagamento
      t.date :data
      t.float :desconto
      t.float :acrescimo
      t.references :cliente,foreign_key: true
      t.timestamps
    end
  end
end
