class Water < ActiveRecord::Base
  extend FriendlyId

  friendly_id :name, use: :slugged

  belongs_to              :fishery, touch: true
  belongs_to              :water_type

  has_and_belongs_to_many :species

  has_many :images, dependent: :destroy

  validates_presence_of :fishery_id

  validates_presence_of :name, message: "Water name can't be blank"
  validates_presence_of :species, message: "You need to select at least one fish species"
  validates_presence_of :water_type_id, message: "You need to select a water type"
  validates :latitude , numericality: { greater_than_or_equal_to:  -90, less_than_or_equal_to:  90 }
  validates :longitude, numericality: { greater_than_or_equal_to: -180, less_than_or_equal_to: 180 }

  reverse_geocoded_by :latitude, :longitude

  after_validation :update_address

  def meta_title
    "Fly fishing at #{self.name.strip}, #{self.short_address}"
  end

  def meta_description
    (self.description.blank?) ? meta_title : "#{meta_title}. #{self.description}"
  end

  def season_start=(value)
    super(Date.parse(value).change({year: 2012}))
  end

  def season_end=(value)
    super(Date.parse(value).change({year: 2012}))
  end

  def short_address
    return nil if address.blank?
    address.split(', ')[0..1].join(", ")
  end

  private

  def update_address
    reverse_geocode if self.address.blank?
  end
end
