class Bill < ApplicationRecord
  validates :amount,
            :due_date,
            :status, presence: true

  validates :amount, numericality: { greater_than: 0 }

  enum status: {
    open: "open",
    pending: "pending",
    paid: "paid"
  }
end
