json.ignore_nil!

json.set! :@context, "http:\/\/schema.org\/"
json.set! :@type, 'Organization'
json.name @fishery.name
json.url @fishery.contact_details.website
json.address @fishery.address.formatted
json.email @fishery.contact_details.email
json.telephone @fishery.contact_details.telephone

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
