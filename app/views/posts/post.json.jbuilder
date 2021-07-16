
json.array! @posts do | post |
  json.id post.id
  json.content post.description
  json.set! :location do
    json.lat post.latitude
    json.lng post.longitude
  end
  json.set! :media do 
    json.imageSrc "https://#{Rails.application.config.imgix[:source]}#{post.image.path(:original)}"
    json.type 'image'
  end
  json.timeStamp post.date
end
