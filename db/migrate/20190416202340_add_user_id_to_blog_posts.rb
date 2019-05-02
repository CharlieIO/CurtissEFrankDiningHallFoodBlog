class AddUserIdToBlogPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :blog_posts, :user_id, :integer
  	add_column :blog_posts, :user_id, :integer
  end
end
