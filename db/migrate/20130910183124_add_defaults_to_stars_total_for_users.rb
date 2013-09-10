class AddDefaultsToStarsTotalForUsers < ActiveRecord::Migration
  def change
    change_column :users, :stars, :integer, :default => 0
    change_column :users, :total, :integer, :default => 0
  end
end
