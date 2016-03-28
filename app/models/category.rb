class Category < ActiveRecord::Base
  belongs_to :admin

  has_many :questions

  has_many :categories_answers
  has_many :asnwers, through: :categories_answers

  has_many :test_attempts
end
