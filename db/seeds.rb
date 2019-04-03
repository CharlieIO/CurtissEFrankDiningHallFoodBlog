# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

BlogPost.delete_all

BlogPost.create!(title: "Gross Spinach", description: "watery, and glowing green.", location: "Frank", category: "Dinner", rating: 1)
BlogPost.create!(title: "Clam Chowder", description: "pretty good, feels like i'm back in Boston.", location: "Coop", category: "Lunch", rating: 4)
BlogPost.create!(title: "Lovely Roast Chicken", description: "well seasoned, not dry, even better with bbq sauce.", location: "Library Cafe", category: "Dinner", rating: 5)
BlogPost.create!(title: "Penne a la vodka", description: "ah, just like grandmothers!", location: "Coop", category: "Lunch", rating: 5)
BlogPost.create!(title: "Sketchy Rice Pilaf", description: "dont try it, way too chunky and been sitting out for what seems like days.", location: "Coop", category: "Breakfast", rating: 0)
