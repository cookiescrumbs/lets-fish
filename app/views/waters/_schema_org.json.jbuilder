json.ignore_nil!

json.set! :@context, 'http://schema.org/'
json.set! :@type, 'Organization'
json.name @fishery.name
json.url @fishery.contact_details.website
json.address @fishery.address.formatted
json.email @fishery.contact_details.email
json.telephone @fishery.contact_details.telephone

json.set! :areaServed do
  json.set! :@type, 'LakeBodyOfWater'
  json.name @water.name
  json.hasMap "https://www.google.com/maps?ll=#{@water.latitude},#{@water.longitude}&q=#{@water.latitude},#{@water.longitude}&hl=en&t=m&z=12"
  json.set! :geo do
    json.set! :@type, 'GeoCoordinates'
    json.latitude @water.latitude
    json.longitude @water.longitude
  end
end

json.set! :hasOfferCatalog do
  json.set! :@type, 'OfferCatalog'
  json.name 'Fly Fishing'
  json.set! :itemListElement do
    json.array! @species do | species |
      json.set! :@type, 'Offer'
      json.set! :itemOffered do
        json.set! :@type, 'Product'
        json.name species.name
      end
    end
  end
end
