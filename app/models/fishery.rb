class Fishery < ActiveRecord::Base
  extend FriendlyId

  friendly_id :name, use: :slugged

  validates :name, presence: { message: "Fishery name can't be blank" }
  validates :description, presence: { message: "Fishery description can't be blank" }

  has_many :user_fisheries
  has_many :users, through: :user_fisheries

  has_many :waters, dependent: :destroy

  has_one  :contact_details
  accepts_nested_attributes_for :contact_details

  has_one :address
  accepts_nested_attributes_for :address

  # need to get all species from across all waters ["brown trout", "salmon", "sea trout"]
  def species
    self.waters.map{|water| water.species.map{|s| s.name } }.flatten.uniq.sort
  end

  # need to get all the water types from across all waters ["lake", "river"]
  def water_types
    self.waters.map{|water| water.water_type.category}.uniq.sort
  end

  def latitude
    return google_places_details['geometry']['location']['lat'] if google_places_details?
    address.latitude
  end

  def longitude
    return google_places_details['geometry']['location']['lng'] if google_places_details?
    address.longitude
  end

  def geographic_center_of_waters
    Geocoder::Calculations.geographic_center(self.waters)
  end

  private

  def google_places_details
    return nil if place_id.blank?
    Geocoder.search(place_id, lookup: :google_places_details).first.data
  end

  def google_places_details?
    !place_id.blank?
  end
end
