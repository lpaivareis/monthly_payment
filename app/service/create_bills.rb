class CreateBills < ApplicationService
  attr_reader :enrollment

  delegate :id, :due_day, :installments, :amount, to: :enrollment, prefix: true

  def initialize(params)
    @enrollment = params
  end

  def call
    create_bills
  end

  private

  def create_bills
    i = 0
    bills = []

    while i < enrollment_installments
      @bill = Bill.create(bill_params)
      bills << @bill

      i += 1
    end

    @enrollment.update!(bills: bills)
  end

  def bill_params
    {
      due_date: due_date,
      enrollment_id: enrollment_id,
      amount: enrollment_amount / enrollment_installments
    }
  end

  def bill_due_date
    if find_bill.present?
      find_bill.last.due_date + 1.month
    else
      Date.new(Time.zone.now.year, Time.zone.now.month,
               enrollment.due_day)
    end
  end

  def due_date
    if bill_due_date < Time.zone.now
      bill_due_date + 1.month
    else
      bill_due_date
    end
  end

  def find_bill
    Bill.where(enrollment_id: enrollment_id)
  end
end
