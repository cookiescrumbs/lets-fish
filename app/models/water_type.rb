class WaterType < ActiveRecord::Base
  has_many :waters

  validates :category, presence: true

end
