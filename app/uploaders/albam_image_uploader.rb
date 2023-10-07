class AlbamImageUploader < CarrierWave::Uploader::Base
    if Rails.env.production?
        include Cloudinary::CarrierWave
    else
        storage :file
    end
    
    include CarrierWave::MiniMagick
    process resize_to_limit: [1200, 1200]

    def store_dir
        "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    end

    def default_url 
        'sample.jpg'
    end

    def extension_whitelist # 拡張子の制限
        %w[jpg jpeg gif png]
    end

    def albam_attached?
        !model.avatar.file.nil?
    end

end
