class Fishery < ActiveRecord::Base
  has_many :reports
  has_many :tickets

  has_many :waters

  validates_presence_of :name
end
