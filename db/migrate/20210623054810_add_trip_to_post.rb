class AddTripToPost < ActiveRecord::Migration[6.0]
  def change
    add_reference :posts, :trip, foreign_key: true
  end
end
