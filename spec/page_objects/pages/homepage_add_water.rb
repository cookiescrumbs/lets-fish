module PageObjects
  class HomepageAddWater < SitePrism::Page
    set_url "/add/water/{id}"

    element :alert, "div.alert"
    element :name, "input#water-name"
    element :latitude, "input#latitude"
    element :longitude, "input#longitude"
    element :submit, "button[name='button']"
  end
end
