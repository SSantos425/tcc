class ListCompra < ApplicationRecord
  belongs_to :compra
  belongs_to :produto

    def total_parcial
      produto.preco_compra * quantity
    end

    def total_compra_parcial
      produto.preco_compra * quantity
    end
end
