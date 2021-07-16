json.content @trip.description
json.set! :media do 
  json.imageSrc "https://#{Rails.application.config.imgix[:source]}#{@trip.image.path(:original)}"
  json.type 'image'
end
json.title @trip.title
json.timeStamp @trip.date
