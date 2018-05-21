class Image < ActiveRecord::Base
  belongs_to :water

  before_save :hash_attribution

  # hero
  # geograph_id
  # image_file_name
  # image_content_type
  # image_file_size
  # image_updated_at
  # geograph_photo_id
  # attribution

  has_attached_file :image
  # process_in_background :image
  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  private

  def hash_attribution
    self.attribution = JSON.parse(attribution) if attribute_present?('attribution')
  end
end
