class User < ApplicationRecord

  has_many :inventorylists
  has_many :produtos, through: :inventorylists

  has_many :vendas
  has_many :produtos, through: :vendas

  has_one :wallet

  
  devise :database_authenticatable, :registerable,:recoverable, :rememberable, :validatable

  def username
    return self.email.split('@')[0].capitalize
  end
end
