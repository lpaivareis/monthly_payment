class AddIndexInCpfColumnInStudentsTable < ActiveRecord::Migration[7.0]
  def change
    add_index :students, :cpf, unique: true
  end
end
