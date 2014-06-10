class Fishery < ActiveRecord::Base
  has_many :waters, :dependent => :destroy

  validates_presence_of :name
end
