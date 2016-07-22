# encoding: utf-8

class EntryHeaderUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  process convert: 'jpg'
  process tags: ['header_image']

  cloudinary_transformation transformation: [
    width: 1366, height: 720 , crop: :scale
  ]

  def extension_whitelist
    %w(jpg jpeg png)
  end

end
