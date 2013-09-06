class AddCommentsToBids < ActiveRecord::Migration
  def change
    add_column :bids, :comments, :text
  end
end
