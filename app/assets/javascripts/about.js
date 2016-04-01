$(function() {
  $('#from_text').keyup(function(){
    var $input = $(this).val();
    if($input.length <= 10){
      $('.text_to_sign').html($(this).val());
    };
  });
})
