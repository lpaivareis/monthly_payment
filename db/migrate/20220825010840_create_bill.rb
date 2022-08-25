class CreateBill < ActiveRecord::Migration[7.0]
  def change
    create_table :bills do |t|
      t.integer :amount
      t.datetime :due_date
      t.string :status, default: "open"
      t.belongs_to :enrollment, index: true
      t.timestamps
    end
  end
end
