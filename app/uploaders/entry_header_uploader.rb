# encoding: utf-8

class EntryHeaderUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  process convert: 'jpg'
  process tags: ['header_image']

  version :standard do
    process resize_to_fill: [100, 150, :north]          
  end

end
