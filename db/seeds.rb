# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Friendship.delete_all
User.delete_all

User.create(username: "User 1", email: "1@2", password: "123123")
User.create(username: "User 2", email: "2@3", password: "123123")

User.find_by(username: "User 1").friends << User.find_by(username: "User 2")
