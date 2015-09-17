module PageObjects
  class Search < SitePrism::Page
    set_url '/search{?query*}'

    element :map, '#map'
    elements :results, '.result-item'
  end
end
