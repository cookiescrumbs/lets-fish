class UserFishery < ActiveRecord::Base
  belongs_to :user
  belongs_to :fishery
end
