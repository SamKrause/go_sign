$(document).ready(function(){
  var question_array = [];
  var $category_name = $('.category_name');
  $category_name.click(function(){
    if ($(this).text() == "Family"){
      console.log("true, this is family");
      var gfamily = gon.family_answers;
      console.log(gfamily.length);
      for(var i = 0; i < gfamily.length; i ++){
        console.log(gfamily[i].name);
      }
      $('.question').html("<img src=\"gfamily[0].gif\">");
    }
  });

})
