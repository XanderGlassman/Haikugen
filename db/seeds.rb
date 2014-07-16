# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

nat = User.create(first_name: "Natalie", last_name: "Glassman")
xan = User.create(first_name: "Xander", last_name: "Principe")

poem = Poem.create(user_id: nat.id, title: "the hunt")

book = Book.create(user_id: nat.id)

Like.create(user_id: nat.id, likeable_id: poem.id, likeable_type: "Poem")
Like.create(user_id: nat.id, likeable_id: xan.id, likeable_type: "User")
