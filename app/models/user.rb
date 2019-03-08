class User < ApplicationRecord
  has_many :debts, dependent: :destroy
  has_many :categories, through: :debts
  has_many :payments, dependent: :destroy
  has_secure_password

  validates :username, uniqueness: true
  validates :name, presence: true
  validates :email, presence: true
  validates :date_of_birth, presence: true
  validate :correct_date

  mount_uploader :image, ImageUploader

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

  def correct_date
    if self.date_of_birth
      if self.date_of_birth >= Time.now
        errors.add(:date_of_birth, "is invalid")
      end
    end
  end

end
