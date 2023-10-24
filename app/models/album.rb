class Album < ApplicationRecord
    belongs_to :user

    validates :title, presence: true, length: { maximum: 255 }
    validates :introduction, length: { maximum: 655 }
    validates :album_image, presence: true

    mount_uploader :album_image, AlbumImageUploader
end
