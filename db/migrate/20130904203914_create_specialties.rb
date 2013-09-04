class CreateSpecialties < ActiveRecord::Migration
  def change
    create_table :specialties do |t|
      t.integer :author_id, :null => false
      t.integer :parent_id
      t.string :name, :null => false
      t.text :description, :null => false

      t.timestamps
    end
    add_index :specialties, :name, :unique => true
    add_index :specialties, :parent_id
  end
end
