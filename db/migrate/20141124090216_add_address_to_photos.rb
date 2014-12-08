class AddAddressToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :address, :string
    add_index :photos, :address
  end
end
