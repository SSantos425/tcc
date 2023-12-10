class Cartlist < ApplicationRecord
    has_many :cartlist_orderables
    has_many :produtos, through: :cartlist_orderables
    has_many :clientes, through: :cartlist_orderables

    belongs_to :cliente
   
end
