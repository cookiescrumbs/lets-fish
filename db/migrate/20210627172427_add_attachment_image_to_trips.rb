class AddAttachmentImageToTrips < ActiveRecord::Migration[6.0]
  def self.up
    change_table :trips do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :trips, :image
  end
end
