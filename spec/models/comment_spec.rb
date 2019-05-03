require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe "check attributes and methods" do
    it "should be able to create a comment object which has the correct methods on it" do
      user1 = User.new
      user1.email = 'test1@example.com'
      user1.password = "colgate"
      # user1.encrypted_password = '#$taawktljasktlw4aaglj'
      user1.save!
      bp = BlogPost.create!(user: user1, title: "chicken", category: "Dinner", location: "Frank", description: "Yummy, yummy, chicken", rating: 4)
      comment1 = bp.comments.create!(comment: "very bad", user: user1, blog_post: bp)

      expect(comment1).to respond_to :comment
      expect(comment1).to respond_to :user_id
      expect(comment1).to respond_to :blog_post_id
    end
  end
end
