//   $(".event").mouseenter(function(){

//     $(".secondary", this).slideToggle(500);
//     }).mouseleave(function(){
//       $(".secondary", this).slideToggle(500);


$(document).ready(function(){
  
  var filterToggle = true;
  
  $('.datepicker').pickadate({
      format_submit: 'yyyy-mm-dd',
      onSelect: function() {
        filterToggle = true;
        var date = $("input[type='hidden']").val();
        $.get('/timeline/filter', { date: date }, 
            function(data){
              $("ol.timeline").html(data);
          });
      }
  });

  $('#resourcefilter').submit(function(e){
    e.preventDefault();

    filterToggle = true;
    var types = []
    $.each($("input:checked"), function(){
      var type = $(this).attr("id");
      types.push(type);
    });

    $.get('/timeline/filter', { types: types }, function(data) {
      $("ol.timeline").html(data);
    });
  });

  $('#peoplefilter').submit(function(e){
    e.preventDefault();

    var people = []
    $.each($("input:checked"), function(){
      var person = $(this).attr("id");
      people.push(person);
    });

    $.get('/timeline/filter', { people: people }, function(data) {
      console.log(data)
      $("ol.timeline").html(data);
    });

  });

  var loadScrollDetect = function(){
    if ($(window).scrollTop() > $(document).height() - $(window).height() - 200) {    
      $(window).unbind('scroll');
      loadEvents();
    }
  };

  var loadEvents = function(){
    var last_date = $('ol.timeline li:last').data('date');
    $.ajax({
      url: 'timeline/infinite',
      data: {published_at: last_date},
      success: function(data){
        if (data.length > 1){
          $("ol.timeline").append(data);
        } else {
          var new_date = moment(last_date).subtract('days', 1).format('YYYY-MM-DD');
          new_date = String(new_date);
          $("ol.timeline li:last").after('<li data-date=' + new_date + '></li>').hide();
        }
      },
      complete: function(date, textStatus){
        $(window).bind('scroll', loadScrollDetect);
      }
    });
  }

  $(window).bind('scroll', loadScrollDetect);

  $(setInterval(function(){
    if(filterToggle === false){
      var raw_date  = $('ol.timeline li:first').data('date');
      var last_date = formatTimestamp(raw_date);
      console.log(last_date);
      $.ajax({
        url: '/timeline/poll',
        data: {published_at: last_date},
        success: function(data){
          $("div#date-header:first").after(data);
        },
        error: function(data){
          console.log(data);
        }
      });
    }
  }, 3000));

function formatTimestamp(timestamp){
  return timestamp.replace(/Z/,'').replace(/T/, ' ');
}

});






    // $(window).scroll(function() {
    //   if ($(window).scrollTop() > $(document).height() - $(window).height() - 200) {
    //     $(window).unbind('scroll');
    //     var last_date = $('ol.timeline li:last').data('date');
    //     $.get('timeline/infinite',
    //       {published_at: last_date},
    //       function(data){
    //         $("ol.timeline").append(data);
    //       }
    //     );
    //   }
    // });
    //   $(window).bind('scroll');
