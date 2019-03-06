class User < ApplicationRecord

  has_many :debts
  has_many :categories, through: :debts
  has_many :payments
  has_secure_password

  def total
    self.debts.inject(0) {|sum, debt| sum + debt.amount }
  end
end
