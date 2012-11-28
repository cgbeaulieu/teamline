

// $(setInterval(function(){
//   if(filterToggle === false){
//     var raw_date  = $('ol.timeline li:first').data('date');
//     var last_date = formatTimestamp(raw_date);
//     console.log(last_date);
//     $.ajax({
//       url: '/timeline/poll',
//       data: {published_at: last_date},
//       success: function(data){
//         $("div#date-header:first").after(data);
//       },
//       error: function(data){
//         console.log(data);
//       }
//     });
//   }
// }, 3000));

// function formatTimestamp(timestamp){
//   return timestamp.replace(/Z/,'').replace(/T/, ' ');
// }