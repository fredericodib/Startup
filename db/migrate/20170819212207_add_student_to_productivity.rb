class AddStudentToProductivity < ActiveRecord::Migration[5.1]
  def change
    add_reference :productivities, :student, foreign_key: true
  end
end
