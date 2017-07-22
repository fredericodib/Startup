class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.integer :number
      t.references :quiz, foreign_key: true

      t.timestamps
    end
  end
end
