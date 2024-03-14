class AddNumeroToClientes < ActiveRecord::Migration[7.0]
  def change
    add_column :clientes, :numero, :integer
  end
end
