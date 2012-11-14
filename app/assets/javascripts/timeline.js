$(function(){
  // When the page loads, wait a minute then
  // start a polling loop that polls the server
  // every minute

  setTimeout(pollServer, 5000)
})

function pollServer(){
  // What data should this submit about the current
  // data or the last poll time that will
  // help the server not send back already inserted
  // content?

  // How to best parse this json and insert it into
  // the dom as HTML?

  $.get('/timeline/poll', function(json){
    //save a reference to the last element that was returned
    //create_at > last objects create_at
    // var = date
    console.log(json);
  }, 'json')

  setTimeout(pollServer, 5000)
};
