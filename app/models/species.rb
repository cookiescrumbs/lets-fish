class Species < ActiveRecord::Base
  has_and_belongs_to_many :waters
  validates_presence_of :name

  def name
    super.capitalize unless super.nil?
  end
end
