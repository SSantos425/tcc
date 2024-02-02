class Inventorylist < ApplicationRecord
    validates :user_id, presence: true
    validates :produto_id, presence: true
    validates :quantity, presence: true


    belongs_to :produto
    belongs_to :user
end
