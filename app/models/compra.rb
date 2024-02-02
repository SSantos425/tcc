class Compra < ApplicationRecord
  belongs_to :fornecedor

  def total(valor)
    @listcompras = ListCompra.where(compra_id: valor)
    total_amount = 0

    @listcompras.each do |listcompra|
      total_amount += listcompra.total_parcial
    end

    total_amount
  end

  def total_compra(valor)
    @listcompras = ListCompra.where(compra_id: valor)
    total_amount = 0

    @listcompras.each do |listcompra|
      total_amount += listcompra.total_compra_parcial
    end

    total_amount
  end
end
