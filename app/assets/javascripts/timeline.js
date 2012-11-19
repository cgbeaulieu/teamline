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
  console.log(object)
  if ($("ol.timeline li:first").is(".right")) {
    var align = "left";
  } else { 
    var align = "right";
  };

  $("ol.timeline:first").prepend("<li class='event " + object.classname + " " + align + "' data-date='" + 
    object.published_at + "'><div class='pointer" + " " + align + "'></div><h2>" + formatTimestamp(object.published_at) + 
    "</h2><div class='secondary'>" + object.content + "</div></li><div class='clear-" + align + "'></div>"); 

}
















;