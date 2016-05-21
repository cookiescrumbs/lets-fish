class Image < ActiveRecord::Base
  belongs_to :water

  has_attached_file :image,
                    styles: {
                      medium: '650x350#',
                      large: '1440x960#'
                    }

  process_in_background :image
  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
