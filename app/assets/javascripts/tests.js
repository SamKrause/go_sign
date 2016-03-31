$(document).ready(function(){
  var question_array = [];
  setCategoryButtons();

  function setCategoryButtons() {
    $('.category_name').click(function(){
      // var $category_name = $(this).text();
      Cookies.set('array_number', 0)
      $.get(
        'family',
        function(response) {
          $('#test').html(response.family_questions);
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
            setCategoryButtons();
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


})
