class RenameAlbamImageColumnToAlbums < ActiveRecord::Migration[7.0]
  def change
    rename_column :albums, :albam_image, :album_image
  end
end
