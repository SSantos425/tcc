class CreateListCompras < ActiveRecord::Migration[7.0]
  def change
    create_table :list_compras do |t|
      t.references :compra, null: false, foreign_key: true
      t.references :produto, null: false, foreign_key: true
      t.float :quantity

      t.timestamps
    end
  end
end
