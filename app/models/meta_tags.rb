module MetaTags
  def meta_title
    "Fly fishing at #{name.strip}, #{short_address}"
  end

  def meta_description
    description.blank? ? meta_title : "#{meta_title}. #{description}"
  end
end
