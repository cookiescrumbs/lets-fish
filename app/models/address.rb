class Address < ActiveRecord::Base
  belongs_to :fishery
  #If there is a places id populate the contact_details and address
  #with data from the Google places object
  #Geocoder.search("ChIJHawH170Je0gRcV-dmFQoqw8", :lookup => :google_places_details)


  def place_details
    #Create Google Place model
    @place = Geocoder.search(place_id, :lookup => :google_places_details).first
  end

  def place_id
   # Fishery.find(fishery_id).place_id
   "ChIJhRwB-yFawokR5Phil-QQ3zM"
  end

  def street
    'hello street' || self[:street]
  end

end
