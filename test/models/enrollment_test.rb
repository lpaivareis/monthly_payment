require "test_helper"

class EnrollmentTest < ActiveSupport::TestCase
  test "invalid if amount is not present" do
    enrollment = Enrollment.new

    assert_not enrollment.valid?

    assert enrollment.errors[:amount].present?
  end

  test "invalid if due_day is not present" do
    enrollment = Enrollment.new

    assert_not enrollment.valid?

    assert enrollment.errors[:due_day].present?
  end

  test "invalid if installments is not present" do
    enrollment = Enrollment.new

    assert_not enrollment.valid?

    assert enrollment.errors[:installments].present?
  end

  test "invalid if amount is greater than 0" do
    enrollment = Enrollment.new({ amount: 0 })

    assert_not enrollment.valid?

    assert_includes enrollment.errors, :amount
    assert enrollment.errors[:amount], "Deve ser maior que 0!"
  end

  test "invalid if installments is greater than 1" do
    enrollment = Enrollment.new({ installments: 1 })

    assert_not enrollment.valid?

    assert_includes enrollment.errors, :installments
    assert enrollment.errors[:installments], "Deve ser maior que 1!"
  end

  test "invalid if due_day is greater_than 1 and less than or equal to 31" do
    enrollment = Enrollment.new({ due_day: 0 })

    assert_not enrollment.valid?

    assert_includes enrollment.errors, :due_day
    assert enrollment.errors[:due_day], "Dia do pagamento deve ser entre o dia 1 e o dia 31!"
  end
end
