class TestsController < ApplicationController
  def index
    @categories = Category.all
  end

  def familyQuestions
    @family = Category.find_by_name("Family")
    @family_answers = @family.answers
    @answers = generateAnswers

    view_string = render_to_string partial: 'tests/family'
    render json: {success: true, family_questions: view_string}
  end

  def foodQuestions
    @food = Category.find_by_name("Food")
    @food_answers = @food.answers
    @answers = generateAnswers

    view_string = render_to_string partial: 'tests/food'
    render json: {success: true, food_questions: view_string}
  end

  def feelingsQuestions
    @feelings = Category.find_by_name("Feelings")
    @feelings_answers = @feelings.answers
    @answers = generateAnswers

    view_string = render_to_string partial: 'tests/feelings'
    render json: {success: true, feelings_questions: view_string}
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
