class CreateFornecedors < ActiveRecord::Migration[7.0]
  def change
    create_table :fornecedors do |t|
      t.string :nome
      t.string :cep
      t.string :endereco
      t.string :numero
      t.string :complento
      t.string :bairro
      t.string :cidade
      t.string :estado
      t.string :fone
      t.string :cnpj
      t.string :insc_estadual
      t.string :razao_social

      t.timestamps
    end
  end
end
