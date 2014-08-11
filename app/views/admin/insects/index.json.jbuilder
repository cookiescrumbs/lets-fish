json.array!(@insects) do |insect|
  json.extract! insect, :id
  json.url insect_url(insect, format: :json)
end
