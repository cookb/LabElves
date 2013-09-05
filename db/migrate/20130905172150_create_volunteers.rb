class CreateVolunteers < ActiveRecord::Migration
  def change
    create_table :volunteers do |t|
      t.integer :task_id, :null => false
      t.integer :elf_id, :null => false
      t.integer :credits_bid, :null => false
      t.datetime :time_bid, :null => false

      t.timestamps
    end
    add_index :volunteers, :task_id
    add_index :volunteers, :elf_id    
  end
end
