class MetaTags

  def self.title(title: nil)
    set_meta_tags title: title
  end

  def self.description(short: nil, full: nil)
    description = (full.blank?) ? short : short + full
    set_meta_tags description: description
  end

end
