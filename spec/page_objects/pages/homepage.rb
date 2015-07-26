require_relative "../sections/address"
require_relative "../sections/contact_details"

module PageObjects
  class Homepage < SitePrism::Page
    set_url "/"

    element :alert, "div.alert"
    element :add_water_section_title, "#add-a-water h2.section-heading"
    element :fishery_name_row, "div.row.fishery-name"
    element :name, "input#fishery-name"
    element :yes, "button[name='yes']"
    element :no, "button[name='no']"
    element :submit, "button[name='submit fishery name']"
    element :unknown, "button[name='unknown']"
    element :search, "input[name='location']"
    element :lng, "input[name='lng']"
    element :lat, "input[name='lat']"
    element :submit_search, ".search form button"
  end
end
