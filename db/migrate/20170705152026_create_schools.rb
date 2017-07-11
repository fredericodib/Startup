class CreateSchools < ActiveRecord::Migration[5.1]
  def change
    create_table :schools do |t|
      t.string :name
      t.string :cep
      t.string :address
      t.string :cnpj
      t.string :social_reason

      t.timestamps
    end
  end
end
