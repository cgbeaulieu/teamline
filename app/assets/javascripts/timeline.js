$(function(){
  // When the page loads, wait a minute then
  // start a polling loop that polls the server
  // every minute

  setTimeout(pollServer, 2000)
})

function pollServer(last_date){

  $.get(
    '/timeline/poll', 
    { created_at: last_date},
    function(json){

      console.log(json);
      // $('body').append("JSON:" + json[1])
  
  }, 'json').success(function(json){
    var new_date = json[json.length-1]['created_at'];
    setTimeout(pollServer(new_date), 2000)
  });
};

// {
//   '2012-11-14 16:25:42 UTC': [
//     {
//       content: "RT <a href="http://twitter.com/withloudhands">@withloudhands</a>: Don't forget that <a href="http://twitter.com/holman">@holman</a> from <a href="http://twitter.com/github">@github</a> will be speaking at <a href="http://twitter.com/DUMBOdevs">@DUMBOdevs</a> at <a href="http://twitter.com/galapagosDUMBO">@galapagosDUMBO</a> Friday! Free pizza and pop! ...",
//       created_at: "2012-11-14T17:10:53Z",
//       handle: "aviflombaum",
//       id: 1,
//       person_id: 1,
//       published_at: "2012-11-14T16:25:42Z",
//       updated_at: "2012-11-14T17:10:53Z"
//     }
//   ]
// }