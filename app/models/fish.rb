class Fish < ActiveRecord::Base
  belongs_to :return

  validates_presence_of :species
end
