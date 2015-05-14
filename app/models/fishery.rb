class Fishery < ActiveRecord::Base

  has_many :waters, dependent: :destroy

  has_one  :contact_details
  accepts_nested_attributes_for :contact_details

  has_one  :address
  accepts_nested_attributes_for :address

end
