class Cart < ApplicationRecord
    has_many :orderables
    has_many :produtos, through: :orderables
    has_many :clientes, through: :orderables

    def total
        orderables.to_a.sum { |orderable| orderable.total }
    end
end
