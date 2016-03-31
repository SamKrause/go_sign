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
