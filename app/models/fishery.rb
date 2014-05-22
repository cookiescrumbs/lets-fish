class Fishery < ActiveRecord::Base
  has_many :reports
  has_many :tickets

  validates_presence_of :name
end
