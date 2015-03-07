# encoding: utf-8

class LogoUploader < CommonUploader

  # Override the directory where uploaded files will be stored.
  def store_dir
    "#{super}/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Create different versions of your uploaded files:
  version :thumb do
    process :resize_to_fit => [300, 300]
  end

  version :logo_small do
    process :resize_to_fit => [100, 100]
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(jpg jpeg gif png)
  end

end
