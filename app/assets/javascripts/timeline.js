$(function(){
  var last_date = $('li:first').data('date');
  setTimeout(pollServer(last_date), 2000);
})

function pollServer(last_date){
  setTimeout(function(){
    $.get(
      '/timeline/poll', 
      { created_at: last_date },
      function(json){
        var last_event = json[json.length-1];        
        var date_query = getQueryDate(last_event, last_date);
        displayNew(json);
        pollServer(date_query);
      }, 
    'json')
  }, 3000);
};

function formatTimestamp(timestamp){
  return timestamp.replace(/Z/,'').replace(/T/, ' ');
}

function getQueryDate(last_event, last_date) {
  if(last_event == null){
    return last_date
  } else {
    return formatTimestamp(last_event.created_at);
  }
}

function displayNew(collection){
  $.each(collection, function(i, object){
    insertEvent(object);
  });
}

function insertEvent(object){
  $("ol:first").prepend("<li class='right' data-date=" + 
    object.created_at + "><i class='pointer'></i><div class='unit-tweet'><div class='storyUnit'><p>" + 
    object.content + "</p></div><ol class='storyActions'><li>" + 
    formatTimestamp(object.published_at) + "</li></ol></div></li>");
}
















