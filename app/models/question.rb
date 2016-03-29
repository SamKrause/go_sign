class Question < ActiveRecord::Base
  belongs_to :category

  has_one :answer

  has_many :attempts

end
