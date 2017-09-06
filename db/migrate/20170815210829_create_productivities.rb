class CreateProductivities < ActiveRecord::Migration[5.1]
  def change
    create_table :productivities do |t|
      t.integer :total_questions
      t.integer :correct_questions
      t.integer :time_studed

      t.timestamps
    end
  end
end
