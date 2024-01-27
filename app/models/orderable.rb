class Orderable < ApplicationRecord
  belongs_to :produto
  belongs_to :cart
  belongs_to :cliente

  def total
    produto.preco * quantity
  end
end
