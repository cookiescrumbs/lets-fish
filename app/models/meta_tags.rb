module MetaTags

  module Water

    def meta_title
      "Fly fishing at #{name.strip}, #{short_address}"
    end

    def meta_description
      description.blank? ? meta_title : "#{meta_title}. #{description.slice(0..160)}"
    end

    def open_graph(url)
      {
        og: {
          title: meta_title,
          type: 'place',
          place: {
            location: {
              latitude: latitude,
              longitude:longitude
            }
          },
          description: meta_description,
          url: url,
          image: (images.first)? images.first.image.url(:medium) : '',
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
          image: (images.first)? images.first.image.url(:medium) : ''
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

    def open_graph(url)
      {
        og: {
          title: meta_title,
          type: 'place',
          place: {
            location: {
              latitude: latitude,
              longitude:longitude
            }
          },
          description: meta_description,
          url: url,
          image: waters.first.images.first.image.url(:medium),
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
          image: waters.first.images.first.image.url(:medium)
        }
      }
    end

  end

end



