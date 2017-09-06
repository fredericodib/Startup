class CreateCronometerLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :cronometer_logs do |t|
      t.references :discipline, foreign_key: true
      t.integer :time
      t.references :student, foreign_key: true

      t.timestamps
    end
  end
end
