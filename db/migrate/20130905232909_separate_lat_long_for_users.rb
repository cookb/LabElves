class SeparateLatLongForUsers < ActiveRecord::Migration
  def change
    remove_column :users, :lat_long
    add_column :users, :latitude, :float
    add_column :users, :longitude, :float
  end
end
