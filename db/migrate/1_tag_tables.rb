class TagTables < ActiveRecord::Migration
  def up
    create_table :taggings do |t|
      t.integer :tag_id,        null: false
      t.integer :taggable_id,   null: false
      t.string  :taggable_type, null: false
      t.timestamps
    end

    add_index :taggings, :tag_id
    add_index :taggings, [:taggable_type, :taggable_id]
    add_index :taggings, [:taggable_type, :taggable_id, :tag_id], unique: true, name: 'unique_taggings'

    create_table :tags do |t|
      t.string :tag, null: false
      t.integer :expires_in
      t.timestamps
    end
  end

  def down
    drop_table :tags
    drop_table :taggings
  end
end