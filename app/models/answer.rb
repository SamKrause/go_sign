class Answer < ActiveRecord::Base
  belongs_to :question

  has_many :categories, through: :categories_answers
  has_many :categories_answers

end
