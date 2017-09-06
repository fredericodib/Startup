class AddDisciplineToProductivity < ActiveRecord::Migration[5.1]
  def change
    add_reference :productivities, :discipline, foreign_key: true
  end
end
