class RemoveStatusResetAtFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :status_reset_at
  end
end
