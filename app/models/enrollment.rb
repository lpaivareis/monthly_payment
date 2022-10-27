class Enrollment < ApplicationRecord
  validates :amount, numericality: { greater_than: 0, message: "Deve ser maior que 0!" }
  validates :installments, numericality: { greater_than: 1, message: "Deve ser maior que 1!" }
  validates :due_day, numericality: { greater_than: 0, less_than_or_equal_to: 31,
                                      message: "Dia do pagamento deve ser entre o dia 1 e o dia 31!" }

  validates :amount,
            :installments,
            :due_day, presence: true

  belongs_to :student
  has_many :bills, dependent: :destroy
end
