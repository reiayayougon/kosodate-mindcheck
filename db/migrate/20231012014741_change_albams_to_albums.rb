class ChangeAlbamsToAlbums < ActiveRecord::Migration[7.0]
  def change
    rename_table :albams, :albums
  end
end
