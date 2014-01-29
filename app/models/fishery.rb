class Fishery < ActiveRecord::Base
  has_many :reports
  has_many :tickets
end
