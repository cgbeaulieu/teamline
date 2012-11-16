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
        console.log(json.length);
        
        $.each(json, function(i, object){
          last_event = object;
          var time_ago = last_event.published_at;
          $("ol:first").prepend("<li data-date=" + object.created_at + ">" + "<span>" + time_ago + "</span><p>" + 
                                 object.content + "</p></li>");
        });

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


