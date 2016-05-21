require_relative '../sections/address'
require_relative '../sections/contact_details'

module PageObjects
  class NewFishery < SitePrism::Page
    set_url '/admin/fisheries/new'

    element :name, 'input#fishery-name'
    element :place_id, 'input#place-id'
    section :contact_details, ContactDetails, '#contact-details'
    section :address, Address, '#address'
    element :submit, "button[name='button']"
  end
end
