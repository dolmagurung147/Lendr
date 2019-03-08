class Payment < ApplicationRecord
  belongs_to :user
  belongs_to :debt

  validates :payment_amount, presence: true

  def make_payment(debt)
    debt.amount -= self.payment_amount
  end

end
