# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(first_name: "Testy", last_name: "Tester", email: "test@tester.com", password: "password", password_confirmation: "password")

Admin.create(name: "AdminTest", email: "admin@tester.com", password: "password", password_confirmation: "password")

Answer.create(answer: 'mom', admin_id: 1)

Attempt.create(user_id: 1, question_id: 1, testattempt_id: 1, correct: "true")

Category.create(name: "Family", admin_id: 1)

CategoriesAnswer.create(category_id: 1, answer_id: 1)

CorrectAnswer.create(answer_id: 1, question_id: 1)

Question.create(admin_id: 1, category_id: 1, answer_id:1)

TestAttempt.create(user_id: 1, category_id: 1)

