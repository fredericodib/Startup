class AddDateToCronometerLog < ActiveRecord::Migration[5.1]
  def change
    add_column :cronometer_logs, :date, :datetime
  end
end
