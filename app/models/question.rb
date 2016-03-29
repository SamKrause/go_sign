class Question < ActiveRecord::Base
  belongs_to :category

  belongs_to :answer

  has_many :attempts

  has_attached_file :gif, :styles => { :medium => "300x300#", :thumb => "200x200#" }
end
