class Question < ActiveRecord::Base
  belongs_to :category

  belongs_to :answer

  has_many :attempts

end
