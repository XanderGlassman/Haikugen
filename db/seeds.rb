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

Book.create(user_id: 1, path: "public/text/Alice.txt", title: "Alice in Wonderland", author: "Louse Carall")

Like.create(user_id: nat.id, likeable_id: poem.id, likeable_type: "Poem")
Like.create(user_id: nat.id, likeable_id: xan.id, likeable_type: "User")


File.open("app/assets/Syllables.txt").each_line do |line|
  word = line.gsub(/=.*/, "").chomp
  syl_count = (line.count ".") + 1
  Word.create(body: word, syllable_count: syl_count)
end
