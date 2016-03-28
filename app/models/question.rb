class Question < ActiveRecord::Base
  belongs_to :admin
  belongs_to :category
  has_many :correct_answers
  has_many :attempts
end
