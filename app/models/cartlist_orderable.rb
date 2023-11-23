class CartlistOrderable < ApplicationRecord
    belongs_to :produto
    belongs_to :cartlist

    def total
        produto.preco * quantity
    end
end
