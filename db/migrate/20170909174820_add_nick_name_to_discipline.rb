class AddNickNameToDiscipline < ActiveRecord::Migration[5.1]
  def change
    add_column :disciplines, :nick_name, :string
  end
end
