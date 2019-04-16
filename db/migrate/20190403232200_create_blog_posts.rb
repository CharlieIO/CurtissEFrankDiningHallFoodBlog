class CreateBlogPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :blog_posts do |t|
      t.belongs_to :user
      t.text :location
      t.string :category
      t.text :description
      t.text :title
      t.integer :rating
      t.integer :user_id

      t.timestamps
    end
  end
end
