class User < ApplicationRecord

  has_many :debts
  has_many :categories, through: :debts
  has_many :payments
  has_secure_password

  validates :username, uniqueness: true
  validates :name, presence: true
  validates :email, presence: true

  def total
    self.debts.inject(0) {|sum, debt| sum += debt.amount }
  end

  def all_payback_debts
    self.debts.select do |debt|
      debt.payback
    end
  end

  def all_reimbursements
    all_reimbursements = []
    all_payback_debts.each do |debt|
      debt.payments.each do |payment|
        all_reimbursements << payment
      end
    end
    all_reimbursements
  end

  def all_debts_associated_with_donation
    self.payments.map do |payment|
      payment.debt
    end.uniq
  end

end
