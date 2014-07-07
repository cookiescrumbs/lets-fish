class CreateFisheriesAndInsects < ActiveRecord::Migration
  def change
    create_table :fisheries_insects, id: false do |t|
      t.belongs_to :fishery
      t.belongs_to :insect
    end
  end
end
