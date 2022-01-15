class AddArticlesToWaters < ActiveRecord::Migration[6.0]
  def change
    add_column :waters, :articles, :jsonb, null: false, default: {}
  end
end
