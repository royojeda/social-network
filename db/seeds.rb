# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Like.delete_all
Comment.delete_all
Post.delete_all
FriendRequest.delete_all
Friendship.delete_all
User.delete_all

u1 = User.create(username: "User 1", email: "1@2", password: "123123")
u2 = User.create(username: "User 2", email: "2@3", password: "123123")
User.create(username: "User 3", email: "3@4", password: "123123")
u4 = User.create(username: "User 4", email: "4@5", password: "123123")

# User.find_by(username: "User 1").friends << User.find_by(username: "User 2")

# User.find_by(username: "User 3").friend_requests.create(sender: User.find_by(username: "User 4"))
# User.find_by(username: "User 3").friend_requests.create(sender: User.find_by(username: "User 1"))

p1 = u1.posts.create(content: "Hello, world!")
u1.posts.create(content: "I am the second post.")
u2.posts.create(content: "My author is User 2")

c1 = p1.comments.create(commenter: u4, body: "Test comment.")

Like.create(liker: u1, likeable: p1)
Like.create(liker: u4, likeable: c1)
