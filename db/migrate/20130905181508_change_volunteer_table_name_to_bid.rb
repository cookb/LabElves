class ChangeVolunteerTableNameToBid < ActiveRecord::Migration
  def change
    rename_table :volunteers, :bids
  end
end
