require_relative "../sections/address"
require_relative "../sections/contact_details"

module PageObjects
  class Homepage < SitePrism::Page
    set_url "/"

    element :alert, "div.alert"
    element :fishery_name_row, "div.row.fishery-name"
    element :name, "input#fishery-name"
    element :yes, "button[name='yes']"
    element :no, "button[name='no']"
    element :submit, "button[name='submit fishery name']"
    element :unknown, "button[name='unknown']"

  end
end
