class CreateSpecJoins < ActiveRecord::Migration
  def change
    create_table :spec_joins do |t|
      t.integer :user_id, :null => false
      t.integer :spec_id, :null => false

      t.timestamps
    end
    add_index :spec_joins, :user_id
    add_index :spec_joins, :spec_id
  end
end
