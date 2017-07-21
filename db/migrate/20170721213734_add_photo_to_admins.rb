class AddPhotoToAdmins < ActiveRecord::Migration[5.1]
  def change
    add_column :admins, :photo, :string
  end
end
