class Fishery < ActiveRecord::Base
  has_many :waters, dependent: :destroy
   
  has_one  :contact_details
  accepts_nested_attributes_for :contact_details, allow_destroy: true

  #has_one  :address, dependent: :destroy
  
  validates :name, presence: true

  # validates :address, presence: true
  validates :contact_details, presence: true

end