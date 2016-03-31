$(document).ready(function(){
  var question_array = [];

  $('.category_name').click(function(){
    // var $category_name = $(this).text();
    Cookies.set('array_number', 0)
    $.get(
      'family',
      function(response) {
        $('#test').html(response.family_questions);
        clickEvent();
        var first_question = $('.next_question').first().html();
        $('#current_question').html(first_question);
        //$('.hidden_answers').remove($('.next_question').first());
      }
    );
  });
  //Logic for Questions

function clickEvent() {
  $('.answer').click(function(){

  });
}
  // $('.answer').click(function(){
  //   $('#question').html("<img src=\"<%= @hidden_array[1].gif %>\"><button class=\"answer\"><%= @hidden_array[1].name %></button><button class=\"answer\"><%= @hidden_array[6].name %></button><button class=\"answer\"><%= @hidden_array[3].name %></button><button class=\"answer\"><%= @hidden_array[9].name %></button>")
  // });

})
