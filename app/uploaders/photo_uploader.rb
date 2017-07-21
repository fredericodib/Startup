class PhotoUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick
 
  storage :file
 
  # Local onde será guardado as imagens
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
 
  ## Tamanhos que o CarrierWave vai salvar as imagens
 
  # Thumb
  version :thumb do
     process resize_to_fill: [35, 35]
  end
 
  # Medium
  version :medium do
     process resize_to_fill: [150, 150]
  end
 
  # Big
  version :big do
     process resize_to_fill: [300, 300]
  end
 
  # Tipos de extensão aceitas
  def extension_whitelist
     %w(jpg jpeg gif png)
  end

end
