class CartlistOrderable < ApplicationRecord
    belongs_to :produto
    belongs_to :cartlist
    belongs_to :cliente

    def total
        produto.preco * quantity
    end
end
