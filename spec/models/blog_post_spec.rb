require 'rails_helper'

RSpec.describe BlogPost, type: :model do
  describe "check attributes and methods" do
    it "should be able to create a BlogPost object which has the correct methods on it" do
      user1 = User.new
      user1.email = 'test1@example.com'
      user1.password = "colgate"
      # user1.encrypted_password = '#$taawktljasktlw4aaglj'
      user1.save!
      bp = BlogPost.create!(user: user1, title: "chicken", category: "Dinner", location: "Frank", description: "Yummy, yummy, chicken", rating: 4)
      expect(bp).to respond_to :title
      expect(bp).to respond_to :category
      expect(bp).to respond_to :location
      expect(bp).to respond_to :description
      expect(bp).to respond_to :rating

    end
  end
end
