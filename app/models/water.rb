class Water < ActiveRecord::Base
  belongs_to              :fishery
  belongs_to              :water_type

  has_and_belongs_to_many :species

  has_many :images

  validates_presence_of :fishery_id
  validates_presence_of :name, message: "Water name can't be blank"
  validates_presence_of :species, message: "You need to select at least one fish species"
  validates_presence_of :water_type_id, message: "You need to select a water type"
  validates :latitude , numericality: { greater_than_or_equal_to:  -90, less_than_or_equal_to:  90 }
  validates :longitude, numericality: { greater_than_or_equal_to: -180, less_than_or_equal_to: 180 }

  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode

  def season_start=(value)
    super(Date.parse(value).change({year: 2012}))
  end

  def season_end=(value)
    super(Date.parse(value).change({year: 2012}))
  end

end
