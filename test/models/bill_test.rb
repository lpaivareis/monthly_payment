require "test_helper"

class BillTest < ActiveSupport::TestCase
  test "invalid if amount is not present" do
    bill = Bill.new

    assert_not bill.valid?

    assert_predicate bill.errors[:amount], :present?
  end

  test "invalid if due_date is not present" do
    bill = Bill.new

    assert_not bill.valid?

    assert_predicate bill.errors[:due_date], :present?
  end

  test "invalid if status is not present" do
    bill = Bill.new({ status: "" })

    assert_not bill.valid?

    assert_predicate bill.errors[:status], :present?
  end

  test "invalid if amount is greater than 0" do
    bill = Bill.new({ amount: 0 })

    assert_not bill.valid?

    assert_includes bill.errors, :amount
    assert bill.errors[:amount], "Deve ser maior que 0!"
  end
end
