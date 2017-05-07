module ImageHelper
  def responsive_image(source:, srcset: {}, options: {})
    srcset = srcset.map { |src, size| "#{asset_path(src)} #{size}" }.join(', ')
    image_tag(source, options.merge(srcset: srcset))
  end
end
