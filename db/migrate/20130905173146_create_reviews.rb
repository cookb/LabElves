class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :task_id, :null => false
      t.string :title
      t.text :comments
      t.boolean :endorse

      t.timestamps
    end
    add_index :reviews, :task_id
  end
end
