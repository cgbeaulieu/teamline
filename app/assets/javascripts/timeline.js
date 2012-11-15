$(function(){
  // When the page loads, wait a minute then
  // start a polling loop that polls the server
  // every minute
  var last_date = $('')

  setTimeout(pollServer("2012-11-15 01:56:15"), 2000)
})

function pollServer(last_date){
  setTimeout(function(){
    console.log(last_date + ' last_dat val at top')
    $.get(
      '/timeline/poll', 
      { created_at: last_date},
      function(json){
        var last_event;

        // $.each(json, function(datetime, events){
          for(var i = 0; i < json.length; i++){
            last_event = json[i];
            $("ul:first").prepend("<li>" + json[i].content + "</li>");
          }
        // })
        var date_query;
        if(last_event == null){
          date_query = last_date
        } else {
          date_query = last_event.created_at.replace(/Z/,'').replace(/T/, ' ');
          console.log(date_query);
        }
        console.log(date_query);
        pollServer(date_query);
      }, 
    'json')
  }, 3000);
};


      // var new_date = json[json.length-1];
        // $.each(json, function(datetime, events){
        //   alert('');
        //   for(var i = 0; i < events.length; i++){
        //     last_event = events[i];
        //     $("ul").prepend("<li>" + events[i].content + "</li>");
        //   }
        // })
