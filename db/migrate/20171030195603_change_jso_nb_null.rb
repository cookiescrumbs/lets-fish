class ChangeJsoNbNull < ActiveRecord::Migration[5.0]
  def change
    change_column :images, :attribution, :jsonb, default: {}
  end
end
