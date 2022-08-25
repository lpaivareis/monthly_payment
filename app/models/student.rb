class Student < ApplicationRecord
  validate :name, presence: true
  validate :document, unique: true

  enum payment_method: {
    credit_card: "credit_card",
    boleto: "boleto"
  }
end
