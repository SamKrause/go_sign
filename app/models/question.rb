class Question < ActiveRecord::Base
  belongs_to :category

  has_many :correct_answers
  has_many :answers, through: :correct_answers

  has_many :attempts

end
