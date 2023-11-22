class Cartlist < ApplicationRecord
    has_many :cartlist_orderables
    has_many :produtos, through: :cartlist_orderables
end
