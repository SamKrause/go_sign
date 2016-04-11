class TestsController < ApplicationController
  def index
    @categories = Category.all
  end

  def familyQuestions
    @family = Category.find_by_name("Family")
    @family_answers = @family.answers
    @answers = generateAnswers(@family_answers)

    view_string = render_to_string partial: 'tests/family'
    render json: {success: true, questions: view_string}
  end

  def foodQuestions
    @food = Category.find_by_name("Food")
    @food_answers = @food.answers
    @answers = generateAnswers(@food_answers)

    view_string = render_to_string partial: 'tests/food'
    render json: {success: true, questions: view_string}
  end

  def feelingsQuestions
    @feelings = Category.find_by_name("Feelings")
    @feelings_answers = @feelings.answers
    @answers = generateAnswers(@feelings_answers)

    view_string = render_to_string partial: 'tests/feelings'
    render json: {success: true, questions: view_string}
  end

  def occupationQuestions
    @occupation = Category.find_by_name("Occupation")
    @occupation_answers = @occupation.answers
    @answers = generateAnswers(@occupation_answers)

    view_string = render_to_string partial: 'tests/occupation'
    render json: {success: true, questions: view_string}
  end

  def transportationQuestions
    @transportation = Category.find_by_name("Transportation")
    @transportation_answers = @transportation.answers
    @answers = generateAnswers(@transportation_answers)

    view_string = render_to_string partial: 'tests/transportation'
    render json: {success: true, questions: view_string}
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

  def generateAnswers(name_of_category_answers)
    answers = []
    while answers.length < 10
      new_answer = name_of_category_answers.sample
      if answers.include?(new_answer)
        next
      else
        answers << new_answer
      end
    end
    return answers
  end

end
