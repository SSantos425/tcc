class User < ApplicationRecord

  has_many :inventorylists
  has_many :produtos, through: :inventorylists

  
  devise :database_authenticatable, :registerable,:recoverable, :rememberable, :validatable
end
