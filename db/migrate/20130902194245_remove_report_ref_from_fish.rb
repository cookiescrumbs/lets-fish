class RemoveReportRefFromFish < ActiveRecord::Migration
  def change
    remove_reference :fish, :report, index: true
  end
end
