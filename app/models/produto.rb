class Produto < ApplicationRecord
    has_many :inventorylists
    has_many :users, through: :inventorylists

    has_many :vendas
    has_many :users, through: :vendas

    has_many :orderables
    has_many :carts, through: :orderables

end
