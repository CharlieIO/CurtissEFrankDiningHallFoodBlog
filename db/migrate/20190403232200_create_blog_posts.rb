class CreateBlogPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :blog_posts do |t|
      t.text :location
      t.string :category
      t.text :description
      t.text :title
      t.integer :rating

      t.timestamps
    end
  end
end
