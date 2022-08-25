class Bill < ApplicationRecord
  validates :amount,
            :due_date,
            :status, presence: true

  validates_numericality_of :amount, greater_than: 0, message: "Deve ser maior que 0!"

  enum status: {
    open: "open",
    pending: "pending",
    paid: "paid"
  }
end
