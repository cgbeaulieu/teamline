
$(setInterval(function(){
    var raw_date  = $('ol.timeline li:first').data('date');
    var last_date = formatTimestamp(raw_date);
    console.log(last_date);
    $.ajax({
      url: '/timeline/poll',
      data: {published_at: last_date},
      success: function(data){
        displayNew(data);
      },
      error: function(data){
        console.log(data);
      }
    });
  }, 2000)
);

function formatTimestamp(timestamp){
  return timestamp.replace(/Z/,'').replace(/T/, ' ');
}

function displayNew(collection){
  $.each(collection, function(i, object){
    // insertEvent(object);
    $("div#date-header:first").after(object);
  });
}

function insertEvent(object){
  console.log(object)
  if ($("ol.timeline li:first").is(".right")) {
    var align = "left";
  } else {
    var align = "right";
  };
  
  // TODO: build this part in strings
  // $("ol.timeline:first").prepend("<li class='event " + object.classname + " " + align + "' data-date='" +
  //   object.published_at + "'><div class='pointer" + " " + align + "'></div><h2>" + formatTimestamp(object.published_at) +
  //   "</h2><div class='secondary'>" + object.content + "</div></li><div class='clear-" + align + "'></div>");
  
  $("div#date-header:first").after("<li class='event " + object.classname + " " + align + "' data-date='" +
    object.published_at + "'><div class='pointer" + " " + align + "'></div><h2>" + formatTimestamp(object.published_at) +
    "</h2><div class='secondary'>" + object.content + "</div></li><div class='clear-" + align + "'></div>");

}

// getScript({
//   url: '/timeline/poll',
//   data: {published_at: last_date}
// )
