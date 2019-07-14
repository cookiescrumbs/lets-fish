module MetaTags

  module Water

    def meta_title
      "Fly fishing at #{name.strip}, #{short_address}"
    end

    def meta_description
      description.blank? ? meta_title : "#{meta_title}. #{description.slice(0..160)}"
    end

    def image_src
      hero_image.present? ? hero_image.image.path(:original) : '/images/missing.png'
    end

    def image_path
      "https://#{Rails.application.config.imgix[:source]}#{image_src}?fit=crop&w=650&h=350"
    end

    def open_graph(url)
      {
        og: {
          title: meta_title,
          type: 'place',
          place: {
            location: {
              latitude: latitude,
              longitude: longitude
            }
          },
          description: meta_description,
          url: url,
          image: image_path,
          site_name: 'Let\'s Fish'
        }
      }
    end

    def twitter
      {
         twitter: {
          card: 'summary_large_image',
          site: '@letsgoflyfish',
          creator: '@letsgoflyfish',
          title: meta_title,
          description: description.slice(0..140),
          image: image_path
        }
      }
    end

    def amp_html(url)
      url + '.amp'
    end

  end

  module Fishery

    def meta_title
      "#{name.strip}, #{address.short}"
    end

    def meta_description
      description.blank? ? meta_title : "#{meta_title}. #{description.slice(0..160)}"
    end

    def image_src
      waters.first.images.first ? waters.first.images.first.image.path(:original) : '/images/missing.png'
    end

    def image_path
      "https://#{Rails.application.config.imgix[:source]}#{image_src}?fit=crop&w=650&h=350"
    end


    def open_graph(url)
      {
        og: {
          title: meta_title,
          type: 'place',
          place: {
            location: {
              latitude: latitude,
              longitude: longitude
            }
          },
          description: meta_description,
          url: url,
          image: image_path,
          site_name: 'Let\'s Fish'
        }
      }
    end

    def twitter
      {
         twitter: {
          card: 'summary_large_image',
          site: '@letsgoflyfish',
          creator: '@letsgoflyfish',
          title: meta_title,
          description: description.slice(0..140),
          image: image_path
        }
      }
    end

  end

end



