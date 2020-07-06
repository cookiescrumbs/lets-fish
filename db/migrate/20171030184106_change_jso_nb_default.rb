class ChangeJsoNbDefault < ActiveRecord::Migration[5.0]
  def change
    change_column :images, :attribution, :jsonb, null: false, default: {}
  end
end
