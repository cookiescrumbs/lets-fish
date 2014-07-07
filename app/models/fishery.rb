class Fishery < ActiveRecord::Base
  has_many :waters, :dependent => :destroy
  has_and_belongs_to_many :insects

  validates_presence_of :name
end
