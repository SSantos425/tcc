class CreateCompras < ActiveRecord::Migration[7.0]
  def change
    create_table :compras do |t|
      t.references :fornecedor,foreign_key: true
      t.integer :numero_nota
      t.integer :serie
      t.string :data_emissao
      t.string :data_recebimento
      t.float :total_nota
      t.float :total_produtos
      t.float :desconto
      t.float :acrescimos
      t.float :frete

      t.timestamps
    end
  end
end
