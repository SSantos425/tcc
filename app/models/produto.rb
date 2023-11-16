class Produto < ApplicationRecord
    has_many :inventorylists
    has_many :users, through: :inventorylists

    has_many :vendas
    has_many :users, through: :vendas

end
