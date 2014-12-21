class Fishery < ActiveRecord::Base
  has_many :waters, dependent: :destroy
  
  has_one  :address, dependent: :destroy
  has_one  :contact_details, dependent: :destroy

  validates :name, presence: true
  validates :address, presence: true
  validates :contact_details, presence: true
end
