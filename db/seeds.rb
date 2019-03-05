# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all

#USERS
matt = User.create(username: "lizardmen22", email: "sotek222@yahoo.com", name: "Matthew Masiello", age: 26)
dolma = User.create(username: "dol", email: "dolmagurung147@gmail.com", name: "Dolma Gurung", age: 24)
brianna = User.create(username: "bdix", email: "bdix666@gmail.com", name: "Brianna Dixon", age: 26)
josh = User.create(username: "gluckin_stein", email: "josh_gluck@gmail.com", name: "Josh Gluck", age: 22)
eric = User.create(username: "noobert", email: "noobert93@gmail.com", name: "Eric Hardiman", age: 25)

Category.destroy_all

#Categories
vetinary = Category.create(name: "Vetinary Bills")
medical = Category.create(name: "Medical Bills")
accident = Category.create(name: "Accidents")
education = Category.create(name: "Student Loans")
personal = Category.create(name: "Personal Debts")
home = Category.create(name: "Mortgages")

Debt.destroy_all

student_loan = Debt.create(user_id: dolma.id, category_id: education.id, amount: 3500.00, story: "Took out a student loan to help further my career as a web developer, but I cant afford to keep up with payments. Please help me pay for it!", due_date: Date.parse("Dec 8 2015"), payback: true)
animal_surgery = Debt.create(user_id: matt.id, category_id: vetinary.id, amount: 5000.00, story: "My goldfish needs a new bionic tail, but its too expensive please help me pay for my little pals surgery.", due_date: Date.parse("Jan 28 2018"), payback: false)
medical_debt = Debt.create(user_id: eric.id, category_id: medical.id, amount: 1500.00, story: "Im having cybernetics installed throughout my body. Cant afford it... help please", due_date: Date.parse("April 21 2019"), payback: false)
personal_debt = Debt.create(user_id: josh.id, category_id: personal.id, amount: 20000.00, story: "Want to buy steve jobs' coffin", due_date: Date.parse("March 31 2019"), payback: true)
another_student = Debt.create(user_id: brianna.id, category_id: education.id, amount: 10000.00, story: "Took out a student loan to help further my career as a web developer, but I cant afford to keep up with payments. HEEELLLLPPPPP!!!", due_date: Date.parse("Feb 15 2025"), payback: false)
