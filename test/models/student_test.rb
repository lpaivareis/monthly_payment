require "test_helper"

class StudentTest < ActiveSupport::TestCase
  test "invalid if name is not present" do
    student = Student.new

    assert_not student.valid?

    assert_predicate student.errors[:name], :present?
  end

  test "invalid if cpf is not present" do
    student = Student.new

    assert_not student.valid?

    assert_predicate student.errors[:cpf], :present?
  end

  test "invalid if payment_method is not present" do
    student = Student.new

    assert_not student.valid?

    assert_predicate student.errors[:payment_method], :present?
  end

  test "invalid if cpf already exists in the base" do
    student = Student.create(user_data)

    assert_predicate student, :valid?

    student_copy = Student.create(user_data)

    assert_includes student_copy.errors, :cpf
    assert student_copy.errors[:cpf], "CPF já cadastrado em nossa base!"
  end

  def user_data
    {
      name: "lucas",
      cpf: "12345678910",
      payment_method: :credit_card,
      birthdate: Date.new(2020, 1, 15)
    }
  end
end
