class BannerUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave  
end
