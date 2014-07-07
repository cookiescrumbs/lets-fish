class Fishery < ActiveRecord::Base
  has_many :waters, :dependent => :destroy
  
  has_and_belongs_to_many :insects
  has_and_belongs_to_many :species

  validates_presence_of :name
end
