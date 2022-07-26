# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Profile.delete_all
# Like.delete_all
# Comment.delete_all
# Post.delete_all
# FriendRequest.delete_all
# Friendship.delete_all
User.destroy_all
Faker::UniqueGenerator.clear

u1 = User.create(email: "1@2", password: "123123")
u1.create_profile(first_name: "John", last_name: "Doe", birth_date: Date.parse("1997-02-22"))
u2 = User.create(email: "2@3", password: "123123")
u2.create_profile(first_name: "Jane", last_name: "Dee", birth_date: Date.parse("1988-07-15"))
u3 = User.create(email: "3@4", password: "123123")
u3.create_profile(first_name: "Mark", last_name: "Johnson", birth_date: Date.parse("1951-05-09"))
u4 = User.create(email: "4@5", password: "123123")
u4.create_profile(first_name: "John", last_name: "Markson", birth_date: Date.parse("1975-11-30"))

# User.find_by(username: "User 1").friends << User.find_by(username: "User 2")

# User.find_by(username: "User 3").friend_requests.create(sender: User.find_by(username: "User 4"))
# User.find_by(username: "User 3").friend_requests.create(sender: User.find_by(username: "User 1"))

p1 = u1.posts.create(content: "Hello, world!")
u1.posts.create(content: "I am the second post.")
u2.posts.create(content: "My author is User 2")

c1 = p1.comments.create(commenter: u4, body: "Test comment.")

Like.create(liker: u1, likeable: p1)
Like.create(liker: u4, likeable: c1)

100.times do
  u = User.create(email: Faker::Internet.email, password: "123123")
  u.create_profile(first_name: Faker::Name.first_name,
                   last_name: Faker::Name.last_name,
                   birth_date: Faker::Date.birthday(min_age: 13, max_age: 100))
end

20.times do
  Post.create(author: User.find(User.pluck(:id).sample),
              content: Faker::Movies::HarryPotter.unique.quote)
end
