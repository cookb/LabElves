class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :status, :null => false
      t.integer :user_id, :null => false
      t.integer :elf_id
      t.integer :spec_id, :null => false
      t.string :subject, :null => false
      t.text :body, :null => false
      t.integer :duration, :null => false
      t.string :location, :null => false
      t.string :lat_long
      t.integer :credits, :null => false
      t.datetime :time_start, :null => false
      t.datetime :time_end, :null => false
      t.datetime :time_final

      t.timestamps
    end
    add_index :tasks, :user_id
    add_index :tasks, :elf_id
    add_index :tasks, :lat_long
    add_index :tasks, :spec_id
    add_index :tasks, :time_start
    add_index :tasks, :time_end
    add_index :tasks, :time_final
  end
end
