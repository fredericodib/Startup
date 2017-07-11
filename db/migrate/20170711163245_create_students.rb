class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.string :name
      t.string :token
      t.string :email
      t.string :password_digest
      t.string :registration
      t.integer :gender
      t.string :birthday
      t.integer :student_class
      t.references :school, foreign_key: true

      t.timestamps
    end
  end
end
