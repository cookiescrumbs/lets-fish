class WaterType < ActiveRecord::Base
  has_many :waters

  validates :category, presence: true

  # def category
  #   super.titleize unless super.nil?
  # end
  
end
