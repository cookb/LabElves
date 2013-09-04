class AddLatLongToUser < ActiveRecord::Migration
  def change
    add_column :users, :lat_long, :string
  end
end
