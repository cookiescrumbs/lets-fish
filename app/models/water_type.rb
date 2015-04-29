class WaterType < ActiveRecord::Base
  has_many :waters

  validates_presence_of :category
end
