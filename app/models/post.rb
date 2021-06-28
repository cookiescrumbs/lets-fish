class Post <  ActiveRecord::Base
  belongs_to :trip, touch: true

  has_attached_file :image
  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
