$(document).ready(function(){

  setCategoryButtons();

  function setCategoryButtons() {
    $('.category_name').click(function(){
      var $category_name = $(this).text();
      Cookies.set('cookies_category_name', $category_name); // sets cookies to track the category, questions attempted, and number right and wrong answered
      Cookies.set('number_of_right', 0);
      Cookies.set('number_of_wrong', 0);

      $.get(
        $category_name.toLowerCase(),
        function(response) {
          $('#test').html(response.questions);
          $('#preloader').css({"display": "flex", "flex-direction": "column"}); // starts preloader image
          $('.next_question').imagesLoaded( function() {
            $('#preloader').css("display", "none"); // starts preloader image
            var first_question = $('.next_question').first().html();
            $('#current_question').html(first_question);
            $('.next_question').first().remove(); // removes the top most question from the list of questions
            resetQuestionButtons();
          });
        }
      );
    });
  };

  //Logic for Questions

  function resetQuestionButtons() {
    $('.answer').click(function(){
      if($(this).text() == $('.correct_answer').last().text()){
        incrementRight();
        postAttempt("true")
        $('.answer_message').last().html("Correct!").slideDown(1000);
      } else {
        incrementWrong();
        postAttempt("false")
        $('.answer_message').last().slideDown(1000);
      };

      setTimeout(function(){
        if ($('.next_question').first().html()) {
          $('#current_question').html($('.next_question').first().html()).hide().fadeIn(1000);
          $('.next_question').first().remove();
          resetQuestionButtons();
        } else {
          postTestAttempt()
          $.get(
            'finished_test',
            function(response) {
              $('#test').html(response.finished_test);
              var results = "you answered " + Cookies.get('number_of_right') + " questions correctly out of 10 questions.";
              $('#test_results').html(results);
              resetSuccessButtons();
              resetTryAgainButtons();
            }
          )
        }
      }, 4000);
    });
  };

  //Click Back to Category Start

  function resetSuccessButtons() {
    $('.category_start_page_button').click(function(){
      $.get(
        'categories',
        function(response) {
          $('#test').html(response.categories);
          setCategoryButtons();
        }
      )
    });
  }

  function resetTryAgainButtons() {
    $('.category_try_again').click(function(){
      Cookies.set('number_of_right', 0);
      Cookies.set('number_of_wrong', 0);
      $.get(
        Cookies.get('cookies_category_name').toLowerCase(),
        function(response) {
          $('#test').html(response.questions);
          var first_question = $('.next_question').first().html();
          $('#current_question').html(first_question);
          $('.next_question').first().remove();
          resetQuestionButtons();

        }
      );
    });
  }

  function incrementRight() {
    var increase = Number(Cookies.get('number_of_right')) + 1;
    Cookies.set('number_of_right', increase);
  };

  function incrementWrong() {
    var increase = Number(Cookies.get('number_of_wrong')) + 1;
    Cookies.set('number_of_wrong', increase);
  };

  function postAttempt(boolean_answer) {
    data = {
      user_id: Number($('.current_user_id').text()),
      correct: boolean_answer,
      question_id: Number($('.question_id').last().text())
      };
    $.post(
      '../attempts/create',
      data
    );
  };

  function postTestAttempt() {
    data = {
      user_id: Number($('.current_user_id').text()),
      category_id: Number($('.hidden_category_id').text()),
      number_right: Number(Cookies.get('number_of_right')),
      number_wrong: Number(Cookies.get('number_of_wrong'))
      };
    $.post(
      '../test_attempts/create',
      data
    );
  };

})
