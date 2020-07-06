class AddHeroToImages < ActiveRecord::Migration[5.0]
  def change
    add_column :images, :hero, :boolean, default: false
  end
end
