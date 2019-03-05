class User < ApplicationRecord

  has_many :debts
  has_many :categories, through: :debts
  has_many :payments
  has_secure_password

  
end
