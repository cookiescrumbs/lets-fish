require_relative 'meta_tags'

class Water < ActiveRecord::Base
  extend FriendlyId

  include MetaTags

  friendly_id :name, use: :slugged

  belongs_to              :fishery, touch: true
  belongs_to              :water_type

  has_many :species_waters
  has_many :species, through: :species_waters

  has_many :images, dependent: :destroy

  validates :fishery_id, presence: true

  validates :name, presence: { message: "Water name can't be blank" }
  validates :species, presence: { message: 'You need to select at least one fish species' }
  validates :water_type_id, presence: { message: 'You need to select a water type' }
  validates :latitude, numericality: { greater_than_or_equal_to:  -90, less_than_or_equal_to:  90 }
  validates :longitude, numericality: { greater_than_or_equal_to: -180, less_than_or_equal_to: 180 }

  reverse_geocoded_by :latitude, :longitude

  after_validation :update_address

  def season_start=(value)
    super(Date.parse(value).change(year: 2012))
  end

  def season_end=(value)
    super(Date.parse(value).change(year: 2012))
  end

  def short_address
    return nil if address.blank?
    address.split(', ')[0..1].join(', ')
  end

  def lat
    self.latitude
  end

  def lng
    self.longitude
  end

  private

  def update_address
    reverse_geocode if address.blank?
  end
end
