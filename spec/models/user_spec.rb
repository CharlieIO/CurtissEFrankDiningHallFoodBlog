require 'rails_helper'

RSpec.describe User, type: :model do
  describe "check attributes and methods" do
    it "should be able to create a comment object which has the correct methods on it" do
      user1 = User.new
      user1.email = 'test1@example.com'
      user1.password = "colgate"
      # user1.encrypted_password = '#$taawktljasktlw4aaglj'
      user1.save!

      expect(user1).to respond_to :email
    end
  end
end
