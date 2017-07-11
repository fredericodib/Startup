class AddDataToAdmin < ActiveRecord::Migration[5.1]
  def change
    add_column :admins, :cpf, :string
    add_column :admins, :name, :string
    add_reference :admins, :school, foreign_key: true
    add_column :admins, :role, :integer
  end
end
