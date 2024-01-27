class ListCompra < ApplicationRecord
  belongs_to :compra
  belongs_to :produto

    def total_parcial
      produto.preco * quantity
    end

end
