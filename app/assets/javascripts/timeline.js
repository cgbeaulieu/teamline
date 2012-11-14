$(function(){
  // When the page loads, wait a minute then
  // start a polling loop that polls the server
  // every minute

  setTimeout(pollServer, 2000)
})

function pollServer(last_date){
  $.get(
    '/timeline/poll', 
    { created_at: "2012-11-13"},
    function(json){
      $.each(json, function(datetime, events){
        for(var i = 0; i < events.length; i++){
          var e = events[i];
          $("ul").prepend("<li>" + e.content + "</li>");
          console.log(e)
        }
      })
      // var new_date = json[json.length-1]['created_at'];
      // setTimeout(pollServer(), 2000)
    }, 
  'json')
};
