class Answer < ActiveRecord::Base
  has_many :questions, through: :correct_answers
  has_many :correct_answers

  has_many :categories, through: :categories_answers
  has_many :categories_answers

  has_attached_file :gif, :styles => { :medium => "300x300#", :thumb => "100x100#" }, :default_url => "/images/:style/ß"
  validates_attachment_content_type :gif, :content_type => /\Aimage\/.*\Z/
end
