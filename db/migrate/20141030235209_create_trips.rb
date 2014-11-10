class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.integer :user_id
      t.string :title

      t.timestamps
    end
    add_index :trips, :user_id
  end
end
