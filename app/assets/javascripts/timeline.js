$(function(){
  var last_date = $('ol.timeline li:first').data('date');
  setTimeout(pollServer(last_date), 2000);
})

function pollServer(last_date){
  var date_query;
  console.log(last_date);
  setTimeout(function(){
    $.ajax({
      url: '/timeline/poll',
      type: 'GET',
      data: {published_at: last_date},
      dataType: 'json'
    }).success(function(data){
      var last_event = data[data.length-1];        
      date_query = getQueryDate(last_event, last_date);
      displayNew(data);
    }).error(function(data){
      console.log(data)
    }).done(function(){
      pollServer(date_query);
    });
  }, 2000);
}


function formatTimestamp(timestamp){
  return timestamp.replace(/Z/,'').replace(/T/, ' ');
}

function getQueryDate(last_event, last_date) {
  if(last_event == null){
    return last_date
  } else {
    return formatTimestamp(last_event.published_at);
  }
}

function displayNew(collection){
  $.each(collection, function(i, object){
    insertEvent(object);
  });
}

function insertEvent(object){
  $("ol.timeline:first").prepend("<li class='right' data-date=" + 
    object.published_at + "><i class='pointer'></i><div class='unit-tweet'><div class='storyUnit'><p>" + 
    object.content + "</p></div><ol class='storyActions'><li>" + 
    formatTimestamp(object.published_at) + "</li></ol></div></li>");
}
















;