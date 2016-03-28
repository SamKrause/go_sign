class CategoriesAnswer < ActiveRecord::Base
  belongs_to :category
  belongs_to :answer
end
