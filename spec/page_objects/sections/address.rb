module PageObjects
  class Address < SitePrism::Section
    element :postcode, 'input#postcode'
    element :street,   'input#street'
    element :line2,    'input#line2'
    element :region,   'input#region'
    element :country,  'select#country'
  end
end
