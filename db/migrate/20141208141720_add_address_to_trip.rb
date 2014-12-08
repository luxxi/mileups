class AddAddressToTrip < ActiveRecord::Migration
  def change
    add_column :trips, :address, :string
    add_index :trips, :address
  end
end
