$(document).ready(function(){
  var question_array = [];
  setCategoryButtons();

  function setCategoryButtons() {
    $('.category_name').click(function(){
      var $category_name = $(this).text();
      Cookies.set('cookies_category_name', $category_name)
      $.get(
        $category_name.toLowerCase(),
        function(response) {
          $('#test').html(response.questions);
          var first_question = $('.next_question').first().html();
          $('#current_question').html(first_question);
          $('.next_question').first().remove();
          resetQuestionButtons();

        }
      );
    });
  };
  //Logic for Questions

  function resetQuestionButtons() {
    $('.answer').click(function(){
      if ($('.next_question').first().html()) {
        $('#current_question').html($('.next_question').first().html());
        $('.next_question').first().remove();
        resetQuestionButtons();
      } else {
        $.get(
          'finished_test',
          function(response) {
            $('#test').html(response.finished_test);
            resetSuccessButtons();
            resetTryAgainButtons();
          }
        )
      }
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


})
