class ChangeQuestionIdToPostIdInAnswers < ActiveRecord::Migration[7.0]
  def change
    rename_column :answers, :question_id, :post_id
  end
end
