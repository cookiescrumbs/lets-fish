class Image < ActiveRecord::Base
  belongs_to :water

  has_attached_file :image,
                    styles: {
                      lg: '1908',
                      md: '1440',
                      sm: '991',
                      xs: '479'
                    }
  process_in_background :image
  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end