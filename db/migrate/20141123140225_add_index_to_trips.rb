class AddIndexToTrips < ActiveRecord::Migration
  def change
    add_index :trips, :title
  end
end
