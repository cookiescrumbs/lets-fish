require_relative 'meta_tags'

require_relative 'contributors'

class Water < ActiveRecord::Base
  extend FriendlyId

  include MetaTags::Water
  include MapMarker::Water
  include Contributors

  friendly_id :name, use: :slugged

  belongs_to :fishery, touch: true
  belongs_to :water_type

  has_many :species_waters
  has_many :species, through: :species_waters

  has_many :images
  accepts_nested_attributes_for :images, reject_if: ->(i) { (i[:image].blank? && i[:id].blank?) }, allow_destroy: true

  scope :with_articles, -> (number=3) { Water.where.not(articles: {}).limit(number) }
  validates :fishery_id, presence: true

  validates :name, presence: { message: "Water name can't be blank" }
  validates :species, presence: { message: 'You need to select at least one fish species' }
  validates :water_type_id, presence: { message: 'You need to select a water type' }
  validates :latitude, numericality: { greater_than_or_equal_to:  -90, less_than_or_equal_to:  90 }
  validates :longitude, numericality: { greater_than_or_equal_to: -180, less_than_or_equal_to: 180 }

  store_accessor :articles, :article_magazine, :article_date, :article_page, :article_author, :article_affiliate_link, :article_affiliate_mag_image, :article_headline, :article_subheadline

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
    latitude
  end

  def lng
    longitude
  end

  def images_without_hero
    images.reject(&:hero)
  end

  def hero_image
    images.reject do |image|
      !image.hero
    end.first
  end

  def negotiated_permission_tickets
    self[:permission_tickets].present? ? self[:permission_tickets] : fishery.permission_tickets
  end

  def contributor
    get_contributor_by_water self.name
  end

  private

  def update_address
    reverse_geocode if address.blank?
  end

end
