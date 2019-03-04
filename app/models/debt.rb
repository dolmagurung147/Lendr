class Debt < ApplicationRecord

  belongs_to :user
  belongs_to :category
  has_many :payments
  
end
