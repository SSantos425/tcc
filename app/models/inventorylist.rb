class Inventorylist < ApplicationRecord
    validates :user_id, presence: true
    validates :produto_id, presence: true
    validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }


    belongs_to :produto
    belongs_to :user
end
