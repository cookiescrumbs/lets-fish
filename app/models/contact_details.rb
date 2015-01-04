class ContactDetails < ActiveRecord::Base
  belongs_to :fishery

  validates_presence_of :contact_name, :telephone
end