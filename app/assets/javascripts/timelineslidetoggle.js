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


$(document).ready(function(){

  $("#yesterday").click(function(){
    $("li.event").not("[data-date^='2012-11-19']").slideToggle();
  })

  $("#month").click(function(){
    $("li.event[data-date^='2012-11']").slideToggle();
  })

});

