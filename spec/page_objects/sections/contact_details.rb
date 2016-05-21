module PageObjects
  class ContactDetails < SitePrism::Section
    element :name,       'input#contact-name'
    element :telephone,  'input#telephone'
    element :mobile,     'input#mobile'
    element :email,      'input#email'
    element :website,    'input#website'
  end
end
