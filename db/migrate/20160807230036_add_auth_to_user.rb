class AddAuthToUser < ActiveRecord::Migration
  def change
  	 add_column :users, :auth, :string
  end
end
