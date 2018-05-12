class Image < ActiveRecord::Base
  belongs_to :water

  before_save :hash_attribution

  #hero
  #geograph_id
  #image_file_name
  #image_content_type
  #image_file_size
  #image_updated_at
  #geograph_photo_id
  #attribution

  # Removed in favour of using the image service
  has_attached_file :image

  #  styles: {
  #               lg: '1908x650',
  #               md: '1440',
  #               sm: '991',
  #               xs: '479',
  #               thumb: '650x350#'
  #             }
  # process_in_background :image
  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  private

  def hash_attribution
    self.attribution = JSON.parse(attribution) if attribute_present?('attribution')
  end
end
