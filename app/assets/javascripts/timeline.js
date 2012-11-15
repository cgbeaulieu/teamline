$(function(){
  var last_date = $('li:first').data('date');
  setTimeout(pollServer(last_date), 2000)
})

function pollServer(last_date){
  setTimeout(function(){
    $.get(
      '/timeline/poll', 
      { created_at: last_date},
      function(json){
        var last_event;
        var date_query;

        for(var i = 0; i < json.length; i++){
          last_event = json[i];
          $("ul:first").prepend("<li data-date=" + json[i].created_at + ">" + json[i].content + "</li>");
        }

        if(last_event == null){
          date_query = last_date
        } else {
          date_query = last_event.created_at.replace(/Z/,'').replace(/T/, ' ');
        }

        console.log(date_query);
        pollServer(date_query);
      }, 
    'json')
  }, 3000);
};


// var new_date = json[json.length-1];
  // $.each(json, function(datetime, events){
  //   for(var i = 0; i < events.length; i++){
  //     last_event = events[i];
  //     $("ul").prepend("<li>" + events[i].content + "</li>");
  //   }
  // })
