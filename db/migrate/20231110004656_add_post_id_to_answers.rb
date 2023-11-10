class AddPostIdToAnswers < ActiveRecord::Migration[7.0]
  def change
    add_column :answers, :post_id, :bigint
    add_foreign_key :answers, :posts, column: :post_id
  end
end
