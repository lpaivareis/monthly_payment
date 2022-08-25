class Enrollment < ApplicationRecord
  validates :amount, numericality: { greater_than: 0 }
  validates :installments, numericality: { greater_than: 1 }
  validates :due_day, numericality: { greater_than: 0, less_than_or_equal_to: 31 }

  validates :amount,
            :installments,
            :due_day, presence: true
end
