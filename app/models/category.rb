class Category < ApplicationRecord

  has_many :debts
  has_many :users, through: :debts

end
