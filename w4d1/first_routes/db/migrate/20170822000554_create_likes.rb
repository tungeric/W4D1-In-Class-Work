class CreateLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :likes do |t|
      t.integer :comment_id
      t.integer :artwork_id
      t.integer :liker_id, null: false

      t.timestamps
    end
    add_index :likes, [:comment_id, :liker_id], unique: true
    add_index :likes, [:artwork_id, :liker_id], unique: true
    add_index :likes, :liker_id
  end
end
