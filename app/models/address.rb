class Address < ActiveRecord::Base
  belongs_to :fishery

  geocoded_by :formatted
  after_validation :geocode

  def formatted
    %w(street line2 region postcode country).select do |address_comp|
      !send(address_comp).blank?
    end.map { |address_comp| send(address_comp) }.join(', ')
  end

  def short
    %w(region country).select do |address_comp|
      !send(address_comp).blank?
    end.map { |address_comp| send(address_comp) }.join(', ')
  end
end
