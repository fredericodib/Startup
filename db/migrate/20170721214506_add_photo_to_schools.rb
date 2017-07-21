class AddPhotoToSchools < ActiveRecord::Migration[5.1]
  def change
    add_column :schools, :photo, :string
  end
end
