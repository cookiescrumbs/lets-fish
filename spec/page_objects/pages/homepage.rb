module PageObjects
  class Homepage < SitePrism::Page
    set_url "/"

    element :location, "input[name='location']"
    elements :google_places, ".pac-item"
    elements :search_button, "button"
  end
end
