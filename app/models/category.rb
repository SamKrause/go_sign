class Category < ActiveRecord::Base
  has_many :questions

  has_many :categories_answers
  has_many :answers, through: :categories_answers

  has_many :test_attempts
end
