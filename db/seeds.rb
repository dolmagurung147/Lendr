# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all

matt = User.create(username: "lizardmen22", email: "sotek222@yahoo.com", name: "Matthew Masiello", age: 26)
dolma = User.create(username: "dol", email: "dolmagurung147@gmail.com", name: "Dolma Gurung", age: 24)
brianna = User.create(username: "bdix", email: "bdix666@gmail.com", name: "Brianna Dixon", age: 26)
josh = User.create(username: "gluckin_stein", email: "josh_gluck@gmail.com", name: "Josh Gluck", age: 22)
eric = User.create(username: "noobert", email: "noobert93@gmail.com", name: "Eric Hardiman", age: 25)
