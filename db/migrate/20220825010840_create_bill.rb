class CreateBill < ActiveRecord::Migration[7.0]
  def change
    create_table :bills do |t|
      t.string :amount
      t.string :due_date
      t.string :status, default: "open"
      t.timestamps
    end
  end
end
