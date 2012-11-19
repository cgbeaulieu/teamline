$(document).ready(function(){



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


