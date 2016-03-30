class TestsController < ApplicationController
  def index
    @categories = Category.all
    @answers = Answer.all
  end
end
