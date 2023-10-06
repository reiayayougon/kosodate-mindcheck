class Albam < ApplicationRecord
    belongs_to :user

    validates :title, presence: true, length: { maximum: 255 }
    validates :introduction, length: { maximum: 655 }
    validates :albam_image, presence: true
    
    mount_uploader :albam_image, AlbamImageUploader


end
