class SearchController < ApplicationController

  def index
  end

  def within_bounding_box
    waters = Water.within_bounding_box(bounds).limit 20 unless bounds.nil?
    water_markers = markers(waters, WaterMarker)
    place_markers = markers(places, PlaceMarker)

    @markers = array_merge(water_markers, place_markers)
    @results = array_merge(waters, build_places)
    render 'search'
  end

  private


  def build_places
    places.map do | place |
      Place.new do
        self.id = place.id
        self.name = place.name
        self.types = place.types
      end
    end
  end

  def array_merge(one, two)
    a = one.length > two.length ? [one,two] : [two,one]
    a[0].map.with_index{|val,index| [val, a[1][index]].compact }.flatten
  end

  def markers(objs, ext)
    objs.map do | obj |
      marker = Marker.new do
        self.id = obj.id
        self.lat =  obj.lat
        self.lng = obj.lng
        self.name = obj.name
      end
      marker.extend(ext)
    end
  end

  def places
    google_places = GooglePlaces::Client.new(google_api_key)
    google_places.spots(lat,lng, types: ['lodging', 'campground'], radius: five_miles )
  end

  def bounds
    if params[:bounds]
      params[:bounds].split ','
    else
      calculate_bounds
    end
  end

  def calculate_bounds
    Geocoder::Calculations.bounding_box(center_point, 40) unless center_point.nil?
  end

  def center_point
    center_point_from_lat_lng || center_point_from_location
  end

  def center_point_from_lat_lng
    [params[:lat], params[:lng]] unless params[:lat].nil? || params[:lng].nil?
  end

  def center_point_from_location
    Geocoder.coordinates(params[:location]) unless params[:location].nil?
  end

  def center
   params[:center] || []
  end

  def lat
    center[0].to_f
  end

  def lng
    center[1].to_f
  end


  def ten_miles
    17000
  end

  def five_miles
    ten_miles / 2
  end


  def google_api_key
    Rails.application.config.google_api_key
  end

end
