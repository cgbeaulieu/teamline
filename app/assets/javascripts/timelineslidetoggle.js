$(document).ready(function(){

// TODO: Crazy whitespace much?

  $(".event").mouseenter(function(){

    $(".secondary", this).slideToggle(500);
    }).mouseleave(function(){
      $(".secondary", this).slideToggle(500);
  });



  $(".subnav").hide();

    $("#topnav").mouseenter(function(){

      $(".subnav").slideToggle(500);

    });



  $("#blog").click(function(){
    $(".event:not(.post)").slideToggle();
  });

  $("#tweet").click(function(){
    $(".event:not(.tweet)").slideToggle();
  })

  $("#github").click(function(){
    $(".event:not(.ghevent)").slideToggle();
  });

  $("#all").click(function(){
    $(".event").filter(":hidden").slideToggle();
  });

});


$(document).ready(function(){

  $('.datepicker').pickadate({
      format_submit: 'yyyy-mm-dd',
      onSelect: function() {
        var date = $("input[type='hidden']").val();
        console.log(date);
        $.get('/timeline/filter', { date: date }, 
            function(data){
              $("ol.timeline").html(data);
          });

      }
  });

});






