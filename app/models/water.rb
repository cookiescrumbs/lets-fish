class Water < ActiveRecord::Base
  belongs_to :fishery
  
  validates_presence_of :name, :fishery_id

  validates :latitude , numericality: { greater_than_or_equal_to:  -90, less_than_or_equal_to:  90 }
  validates :longitude, numericality: { greater_than_or_equal_to: -180, less_than_or_equal_to: 180 }

  def season_start=(value)
    super(Date.parse(value).change({year: 2012}))
  end

  def season_end=(value)
    super(Date.parse(value).change({year: 2012}))
  end

end
