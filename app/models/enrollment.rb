class Enrollment < ApplicationRecord
  validates_numericality_of :amount, greater_than: 0, message: "Deve ser maior que 0!"
  validates_numericality_of :installments, greater_than: 1, message: "Deve ser maior que 1!"
  validates_numericality_of :due_day, greater_than: 0, less_than_or_equal_to: 31,
                                      message: "Dia do pagamento deve ser entre o dia 1 e o dia 31!"

  validates :amount,
            :installments,
            :due_day, presence: true

  belongs_to :student
  has_many :bills
end
