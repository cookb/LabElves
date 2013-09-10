class AddRatingIndexToUsers < ActiveRecord::Migration
  def change
    add_index :users, :rating
    add_index :users, :stars    
  end
end
