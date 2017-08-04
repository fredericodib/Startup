class AddDisciplineToQuestion < ActiveRecord::Migration[5.1]
  def change
    add_reference :questions, :discipline, foreign_key: true
  end
end
