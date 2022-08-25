class CreateStudent < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.string :name
      t.string :document
      t.datetime :birthdate
      t.string :payment_method
      t.timestamps
    end
  end
end
