class Question < ActiveRecord::Base
  belongs_to :category

  has_many :correct_answers
  has_many :answers, through: :correct_answers

  has_many :attempts

  has_attached_file :gif, :styles => { :medium => "300x300#", :thumb => "200x200#" }
end
