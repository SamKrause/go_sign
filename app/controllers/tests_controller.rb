class TestsController < ApplicationController
  def index
    @categories = Category.all
  end

  def familyQuestions
    @family = Category.find_by_name("Family")
    @family_answers = @family.answers
    @hidden_array = generateHiddenArray
    view_string = render_to_string partial: 'tests/family'
    render json: {success: true, family_questions: view_string}
  end

  def generateHiddenArray
    hidden_array = []
    while hidden_array.length < 10
      family_answer = @family_answers.sample
      if hidden_array.include?(family_answer)
        next
      else
        hidden_array << family_answer
      end
    end
    return hidden_array
  end

end
