class Address < ActiveRecord::Base
  belongs_to :fishery

  def formatted
    ['street','line2','region','postcode','country'].select do |address_comp|
      !send(address_comp).blank?
    end.map {|address_comp| send(address_comp) }.join(', ')
  end
end
