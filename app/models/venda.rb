class Venda < ApplicationRecord
    belongs_to :produto
    belongs_to :vendalist
    belongs_to :user

end
