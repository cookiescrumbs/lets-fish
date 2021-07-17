class Trip < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  # database handles cleaning up the associated records so we don't need 'dependent: :destroy'
  has_many :posts, -> { order date: :asc }

  has_attached_file :image
  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  def formated_date
    date.strftime("%B %e, %Y")
  end

end
