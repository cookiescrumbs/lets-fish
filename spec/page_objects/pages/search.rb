module PageObjects
  class Search < SitePrism::Page
    set_url '/search'

    element :map, '#map'
  end
end
