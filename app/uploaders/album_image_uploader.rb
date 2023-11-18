class AlbumImageUploader < CarrierWave::Uploader::Base
    include CarrierWave::MiniMagick
    process resize_to_limit: [500, 500]

    if Rails.env.production?
        include Cloudinary::CarrierWave
    else
        storage :file
    end

    def store_dir
        "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    end

    def default_url 
        'sample.jpg'
    end

    # 拡張子の制限
    def extension_allowlist
        %w[jpg jpeg gif png]
    end

    def album_attached?
        !model.avatar.file.nil?
    end
end
