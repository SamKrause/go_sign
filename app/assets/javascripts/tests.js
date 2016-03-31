$(document).ready(function(){
  var question_array = [];

  $('.category_name').click(function(){
    // var $category_name = $(this).text();

    $.get(
      'family',
      function(response) {
        $('#test').html(response.family_questions);
      }
    )
      // for(var i = 0; i < gfamily.length; i ++){
        // console.log(gfamily[i].name);
      // }
      // $('.question').html("<img src=\"gfamily[0].gif\">");
  });

})
