class TestsController < ApplicationController
  def index
    @categories = Category.all
  end

  def familyQuestions
    @family = Category.find_by_name("Family")
    @family_answers = @family.answers
    @answers = generateAnswers
    gon.hidden_array = @hidden_array

    view_string = render_to_string partial: 'tests/family'
    render json: {success: true, family_questions: view_string}
  end

  def finishedTestPage
    view_string = render_to_string partial: 'tests/finished_test'
    render json: {success: true, finished_test: view_string}
  end

  def categories
    @categories = Category.all
    view_string = render_to_string partial: 'tests/categories'
    render json: {success: true, categories: view_string}
  end

  def generateAnswers
    answers = []
    while answers.length < 10
      family_answer = @family_answers.sample
      if answers.include?(family_answer)
        next
      else
        answers << family_answer
      end
    end
    return answers
  end


end
