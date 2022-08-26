require "test_helper"

class CreateBillsTest < ActiveSupport::TestCase
  setup do
    @student = Student.create({ name: "lucas", cpf: "092.254.23559", payment_method: :credit_card,
                                birthdate: Date.new(2020, 1, 15) })
    @enrollment = Enrollment.create({
                                      amount: 1_200_000,
                                      installments: 3,
                                      due_day: 5,
                                      student_id: @student.id
                                    })
    @service = CreateBills.new(@enrollment)
  end

  test "returns true if bills created with success" do
    @service.call

    assert true
  end
end
