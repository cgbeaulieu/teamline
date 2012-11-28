//   $(".event").mouseenter(function(){

//     $(".secondary", this).slideToggle(500);
//     }).mouseleave(function(){
//       $(".secondary", this).slideToggle(500);


$(document).ready(function(){
  
  var filterToggle = false;
  
  $('.datepicker').pickadate({
      format_submit: 'yyyy-mm-dd',
      onSelect: function() {
        filterToggle = true;
        var date = $("input[type='hidden']").val();
        $.get('/timeline/filter', { date: date }, 
            function(data){
              $("ol.timeline").html(data);
          });
      }
  });

  $(setInterval(function(){
    if(filterToggle === false){
      var raw_date  = $('ol.timeline li:first').data('date');
      var last_date = formatTimestamp(raw_date);
      console.log(last_date);
      $.ajax({
        url: '/timeline/poll',
        data: {published_at: last_date},
        success: function(data){
          $("div#date-header:first").after(data);
        },
        error: function(data){
          console.log(data);
        }
      });
    }
  }, 3000));

function formatTimestamp(timestamp){
  return timestamp.replace(/Z/,'').replace(/T/, ' ');
}

});






