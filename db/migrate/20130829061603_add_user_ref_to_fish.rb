class AddReportRefToFish < ActiveRecord::Migration
  def change
    add_reference :fish, :report, index: true
  end
end
