class Fornecedor < ApplicationRecord
    validates :nome, :endereco, :cnpj, :insc_estadual, presence: true
    has_many :compras
end
