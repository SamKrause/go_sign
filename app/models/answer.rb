class Answer < ActiveRecord::Base
  has_many :questions, through: :correct_answers
  has_many :correct_answers

  has_many :categories, through: :categories_answers
  has_many :categories_answers

end
