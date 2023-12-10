class Cliente < ApplicationRecord
    has_many :orderables
    has_many :carts, through: :orderables

    has_many :cartlist_orderable
    has_many :cartlist, through: :cartlist_orderable

    has_many :cartlists
end
