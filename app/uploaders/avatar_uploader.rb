class AvatarUploader < CarrierWave::Uploader::Base
    storage :file
    def store_dir
        "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    end
    
    def default_url 
        'sample.jpg'
    end
    
    def extension_whitelist # 拡張子の制限
        %w[jpg jpeg gif png]
    end
    
    def attached?
        !model.avatar.file.nil?
    end
    
end
    