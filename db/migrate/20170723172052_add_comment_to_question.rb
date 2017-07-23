class AddCommentToQuestion < ActiveRecord::Migration[5.1]
  def change
    add_column :questions, :comment, :text
  end
end
