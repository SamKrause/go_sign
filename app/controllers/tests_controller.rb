class TestsController < ApplicationController
  def index
    @family = Category.find_by_name("Family")
    @categories = Category.all
    @answers = Answer.all
  end
end
