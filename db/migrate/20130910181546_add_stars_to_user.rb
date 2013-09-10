class AddStarsToUser < ActiveRecord::Migration
  def change
    add_column :users, :stars, :integer
    add_column :users, :total, :integer
    add_column :users, :rating, :float
    add_index :tasks, :latitude
    add_index :tasks, :longitude
    add_index :users, :latitude
    add_index :users, :longitude
  end
end
