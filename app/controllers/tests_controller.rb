class TestsController < ApplicationController
  def index
    @family = Category.find_by_name("Family")
    gon.family_answers = @family.answers.each { |a| a.name }
    @categories = Category.all
    @answers = Answer.all
  end
end
