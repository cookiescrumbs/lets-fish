class ChangeFishWeightToFloat < ActiveRecord::Migration
  def change
    change_column :fish, :weight, :float
  end
end
