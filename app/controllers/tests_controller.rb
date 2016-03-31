class TestsController < ApplicationController
  def index
    @family = Category.find_by_name("Family")
    @family_answers = @family.answers
    gon.family_answers = @family_answers
    @categories = Category.all
    @answers = Answer.all
  end
end
