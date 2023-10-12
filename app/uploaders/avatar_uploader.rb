class AvatarUploader < CarrierWave::Uploader::Base
    include CarrierWave::MiniMagick

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
    
    def extension_allowlist # 拡張子の制限
        %w[jpg jpeg gif png]
    end
    
    def attached?
        !model.avatar.file.nil?
    end
    
end
    