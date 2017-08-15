class AddTypeToDiscipline < ActiveRecord::Migration[5.1]
  def change
    add_column :disciplines, :discipline_type, :integer
  end
end
