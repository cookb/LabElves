class SeparateLatLongForTasks < ActiveRecord::Migration
  def change
    remove_column :tasks, :lat_long
    add_column :tasks, :latitude, :float
    add_column :tasks, :longitude, :float
  end
end
