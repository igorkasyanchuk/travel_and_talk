class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.integer :user_id
      t.string :title
      t.text :body
      t.text :body_html
      t.string :author
      t.string :link_to_source
      t.date :published_on
      t.timestamps
    end
    add_index :posts, :user_id
  end

  def self.down
    remove_index :posts, :user_id
    drop_table :posts
  end
end
