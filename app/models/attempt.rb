class Attempt < ActiveRecord::Base
  belongs_to :user
  belongs_to :test_attempt
  belongs_to :question
end
