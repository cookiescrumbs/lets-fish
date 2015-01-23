require_relative "../sections/address"
require_relative "../sections/contact_details"

module PageObjects
  class Homepage < SitePrism::Page
    set_url "/"

    element :alert, "div.alert"
    element :name, "input#fishery-name"
    element :submit, "button[name='button']"

  end
end