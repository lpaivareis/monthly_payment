class Student < ApplicationRecord
  validates :name,
            :cpf,
            :payment_method, presence: true
  validates :cpf, uniqueness: { message: "CPF já cadastrado em nossa base!" }

  enum payment_method: {
    credit_card: "credit_card",
    boleto: "boleto"
  }
end
