class TestsController < ApplicationController
  def index
    @categories = Category.all
    @questions = Question.all
  end
end
