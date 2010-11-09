class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.string      :title
      t.text        :content
      t.references  :user
      t.text        :rendered_content
      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end
