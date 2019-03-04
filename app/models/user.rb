class User < ApplicationRecord

  has_many :debts
  has_many :categories, through: :debts
  has_many :payments

end
