class Produto < ApplicationRecord
    has_many :inventorylists
    has_many :users, through: :inventorylists
end
