class Return < ActiveRecord::Base
  has_many :fishs
  
  belongs_to :fisherman
  belongs_to :ticket_type
end
