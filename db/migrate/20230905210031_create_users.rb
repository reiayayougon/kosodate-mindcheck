class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false, index: { unique: true }
      t.string :avatar
      t.string :introduction
      t.integer :status, default: "100"
      t.datetime :status_reset_at
      t.string :image

      t.timestamps
    end
  end
end
