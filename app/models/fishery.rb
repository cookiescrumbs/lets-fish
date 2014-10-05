class Fishery < ActiveRecord::Base
  has_and_belongs_to_many :insects
  has_and_belongs_to_many :species

  validates_presence_of :name


  def contact_details
    return_filled_fields ['contact_name', 'telephone', 'mobile', 'email', 'website']
  end

  def other_details
    return_filled_fields ['records', 'season', 'facilities', 'prices']
  end

  def location
    location = { "Address" => address }
    if lat_lng?
      location['Latitude']  = lat_lng.split(',')[0]
      location['Longitude'] = lat_lng.split(',')[1]
    end
    location
  end

  def address
    return_filled_fields(['street', 'line2', 'region', 'country', 'postcode']).values.join(', ')
  end

  private

  def return_filled_fields(fields)
    filled_fields = {}
      fields.each do | field |
        if send("#{field}?")
          filled_fields[ human_readable_format field ] = send("#{field}")
        end
      end
    filled_fields
  end

  def human_readable_format(string)
    self.class.human_attribute_name string
  end
  
end
