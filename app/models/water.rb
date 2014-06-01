class Water < ActiveRecord::Base
  belongs_to :fishery

  validates_presence_of :name, :lat, :lng, :fishery_id
end
