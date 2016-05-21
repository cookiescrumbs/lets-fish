module MetaTags
	
	def meta_title
    "Fly fishing at #{self.name.strip}, #{self.short_address}"
  end

  def meta_description
    (self.description.blank?) ? meta_title : "#{meta_title}. #{self.description}"
  end

end