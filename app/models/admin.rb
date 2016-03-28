class Admin < ActiveRecord::Base
  has_many :questions
  has_many :categories
  has_many :answers
  has_secure_password
end
