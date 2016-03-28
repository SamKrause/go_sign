class TestAttempt < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :attempts

end
