class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :trip_id
      t.string :image

      t.timestamps
    end
    add_index :photos, :trip_id
  end
end
