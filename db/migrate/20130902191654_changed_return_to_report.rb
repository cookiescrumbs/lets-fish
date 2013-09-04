class ChangedReturnToReport < ActiveRecord::Migration
  def change
    rename_table :reports, :returns
  end 
end
