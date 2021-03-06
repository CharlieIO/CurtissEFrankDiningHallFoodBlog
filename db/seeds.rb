# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

BlogPost.delete_all
User.delete_all

user1 = User.new
user1.email = 'test1@example.com'
user1.password = "colgate"
# user1.encrypted_password = '#$taawktljasktlw4aaglj'
user1.save!

user2 = User.new
user2.email = 'test2@example.com'
user2.password = 'colgate'
# user2.encrypted_password = '#$taawktljasktlw4aaglj'
user2.save!

b1 = BlogPost.create!(title: "Gross Spinach", description: "watery, and glowing green.", location: "Frank", category: "Dinner", rating: 1, user: user1)
b2 = BlogPost.create!(title: "Clam Chowder", description: "pretty good, feels like i'm back in Boston.", location: "Coop", category: "Lunch", rating: 4, user: user2)
b3 = BlogPost.create!(title: "Lovely Roast Chicken", description: "well seasoned, not dry, even better with bbq sauce.", location: "Library Cafe", category: "Dinner", rating: 5, user: user1)
b4 = BlogPost.create!(title: "Penne a la vodka", description: "ah, just like grandmothers!", location: "Coop", category: "Lunch", rating: 5, user: user2)
b5 = BlogPost.create!(title: "Sketchy Rice Pilaf", description: "dont try it, way too chunky and been sitting out for what seems like days.", location: "Coop", category: "Breakfast", rating: 0, user: user2)
# byebug
b1.comments.create!(comment: "very bad", user: user1, blog_post: b1)
b2.comments.create!(comment: "very nice", user: user1, blog_post: b2)
b3.comments.create!(comment: "lovelaay!", user: user2, blog_post: b3)
b4.comments.create!(comment: "a la what?", user: user2, blog_post: b4)
b5.comments.create!(comment: "made me sick", user: user1, blog_post: b5)
