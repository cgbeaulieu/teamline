$(function(){
  // When the page loads, wait a minute then
  // start a polling loop that polls the server
  // every minute

  setTimeout(pollServer, 1000)
})

function pollServer(){
  $.get('/timeline/poll', function(json){
    console.log(json);
  }, 'json')

  setTimeout(pollServer, 1000)
};
