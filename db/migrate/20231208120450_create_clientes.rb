class CreateClientes < ActiveRecord::Migration[7.0]
  def change
    create_table :clientes do |t|
      t.string :nome
      t.string :cpf
      t.string :tipo_cliente
      t.integer :cep
      t.string :logradouro
      t.string :bairro
      t.string :localidade
      t.string :uf
      t.string :cnpj
      t.string :inscricao_estadual
      t.string :inscricao_municipal
      t.string :ramo_de_atividade
      t.integer :cod_ibge
      t.text :obs

      t.timestamps
    end
  end
end
