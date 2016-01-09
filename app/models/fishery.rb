class Fishery < ActiveRecord::Base

  has_many :waters, dependent: :destroy

  has_one  :contact_details
  accepts_nested_attributes_for :contact_details

  has_one  :address
  accepts_nested_attributes_for :address

  #If there is a places id populate the contact_details and address
  #with data from the Google places object

  #Geocoder.search("ChIJhRwB-yFawokR5Phil-QQ3zM", :lookup => :google_places_details)
end
