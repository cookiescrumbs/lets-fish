class Insect < ActiveRecord::Base
  has_and_belongs_to_many :fisheries
end
