class AddTypeToSchool < ActiveRecord::Migration[5.1]
  def change
    add_column :schools, :school_type, :integer
  end
end
