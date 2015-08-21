class WaterType < ActiveRecord::Base
  has_many :waters

  validates_presence_of :category

  def category
    (super).titleize unless (super).nil?
  end

end
