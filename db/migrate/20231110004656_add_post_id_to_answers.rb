class AddPostIdToAnswers < ActiveRecord::Migration[7.0]
  def change
    add_column :answers, :post_id, :bigint
  end
end
