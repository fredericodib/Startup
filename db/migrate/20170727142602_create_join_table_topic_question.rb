class CreateJoinTableTopicQuestion < ActiveRecord::Migration[5.1]
  def change
    create_join_table :topics, :questions do |t|
      # t.index [:topic_id, :question_id]
      # t.index [:question_id, :topic_id]
    end
  end
end
