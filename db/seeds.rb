# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(first_name: "Testy", last_name: "Tester", email: "test@tester.com", password: "password", password_confirmation: "password")

AdminUser.create!(email: "admin@tester.com", password: "password", password_confirmation: "password")

Question.create!(category_id: 1, name: "mom")
Question.create!(category_id: 1, name: "aunt")
Question.create!(category_id: 1, name: "boy")
Question.create!(category_id: 1, name: "brother")
Question.create!(category_id: 1, name: "dad")
Question.create!(category_id: 1, name: "girl")
Question.create!(category_id: 1, name: "grandma")
Question.create!(category_id: 1, name: "grandpa")
Question.create!(category_id: 1, name: "sister")
Question.create!(category_id: 1, name: "uncle")

Answer.create!(name: 'mom', question_id: 1, gif: File.new("public/images/seed/mom.gif"))
Answer.create!(name: 'aunt', question_id: 2, gif: File.new("public/images/seed/aunt.gif"))
Answer.create!(name: 'boy', question_id: 3, gif: File.new("public/images/seed/boy.gif"))
Answer.create!(name: 'brother', question_id: 4, gif: File.new("public/images/seed/brother.gif"))
Answer.create!(name: 'dad', question_id: 5, gif: File.new("public/images/seed/dad.gif"))
Answer.create!(name: 'girl', question_id: 6, gif: File.new("public/images/seed/girl.gif"))
Answer.create!(name: 'grandma', question_id: 7, gif: File.new("public/images/seed/grandma.gif"))
Answer.create!(name: 'grandpa', question_id: 8, gif: File.new("public/images/seed/grandpa.gif"))
Answer.create!(name: 'sister', question_id: 9, gif: File.new("public/images/seed/sister.gif"))
Answer.create!(name: 'uncle', question_id: 10, gif: File.new("public/images/seed/uncle.gif"))

Attempt.create!(user_id: 1, question_id: 1, test_attempt_id: 1, correct: "true")

Category.create!(name: "Family")

CategoriesAnswer.create!(category_id: 1, answer_id: 1)
CategoriesAnswer.create!(category_id: 1, answer_id: 2)
CategoriesAnswer.create!(category_id: 1, answer_id: 3)
CategoriesAnswer.create!(category_id: 1, answer_id: 4)
CategoriesAnswer.create!(category_id: 1, answer_id: 5)
CategoriesAnswer.create!(category_id: 1, answer_id: 6)
CategoriesAnswer.create!(category_id: 1, answer_id: 7)
CategoriesAnswer.create!(category_id: 1, answer_id: 8)
CategoriesAnswer.create!(category_id: 1, answer_id: 9)
CategoriesAnswer.create!(category_id: 1, answer_id: 10)


TestAttempt.create!(user_id: 1, category_id: 1)

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
