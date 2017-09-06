class AddDateToProductivity < ActiveRecord::Migration[5.1]
  def change
    add_column :productivities, :date, :datetime
  end
end
