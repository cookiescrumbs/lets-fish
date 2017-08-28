require_relative 'meta_tags'

class Fishery < ActiveRecord::Base
  extend FriendlyId

  include MetaTags::Fishery

  friendly_id :name, use: :slugged

  validates :name, presence: { message: "Fishery name can't be blank" }
  validates :description, presence: { message: "Fishery description can't be blank" }

  has_many :user_fisheries
  has_many :users, through: :user_fisheries

  has_many :waters, -> { order name: :asc }, dependent: :destroy

  has_one  :contact_details
  accepts_nested_attributes_for :contact_details

  has_one :address
  accepts_nested_attributes_for :address

  belongs_to :membership

  # need to get all species from across all waters ["brown trout", "salmon", "sea trout"]
  def species
    self.waters.map{|water| water.species.map{|s| s.name } }.flatten.uniq.sort
  end

  # need to get all the water types from across all waters ["lake", "river"]
  def water_types
    self.waters.map{|water| water.water_type.category}.uniq.sort
  end

  def latitude
    address.latitude
  end

  def longitude
    address.longitude
  end

  def geographic_center_of_waters
    Geocoder::Calculations.geographic_center(self.waters)
  end

end
