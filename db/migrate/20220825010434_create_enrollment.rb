class CreateEnrollment < ActiveRecord::Migration[7.0]
  def change
    create_table :enrollments do |t|
      t.string :amount
      t.string :installments
      t.integer :due_day
      t.timestamps
    end
  end
end
