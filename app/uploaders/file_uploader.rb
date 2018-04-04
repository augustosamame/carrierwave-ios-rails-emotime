# encoding: utf-8

class FileUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  #process resize_to_fit: [200, 200]

  version :thumb do
    process resize_to_fill: [40,40]
  end

  # Override the directory where uploaded files will be stored.
  def store_dir
    "profile_uploads/#{model.id}"
  end

  # Add a white list of extensions which are allowed to be uploaded.
  def extension_white_list
    if FileUploader.respond_to?(:supported_extensions)
      FileUploader.supported_extensions
    else
      FileUploader.default_extensions
    end
  end

  class << self
    AUDIO_EXTENSIONS = %w(acc aif aifc aiff asf au flac m4v mp2 mp3 mpa snd wav
                          wma)
    IMAGE_EXTENSIONS = %w(bmp dib emf gif jfif jpe jpeg jpg png tif tiff wmf)
    VIDEO_EXTENSIONS = %w(asf avi dvr-ms m1v m4v mp2 mp2v mp4 mpe mpeg mpg mpv2
                          wm wmv)

    def default_extensions
      IMAGE_EXTENSIONS
    end
  end
end
