module Trips
  @@date_format = "%B %e, %Y";
  @@trips = [
          {
            id: '-MIYqXXPkV0d4hfhpZAN',
            title: 'Wild Camping at Angle Tarn',
            short_address: 'Lake District, England',
            timestamp: 1532767800,
            formatted_date: Time.at(1532767800).strftime(@@date_format),
            image: '/images/images/000/000/474/original/IMG_0050.jpg'
          }
      ]


  def all
    @@trips
  end

end


