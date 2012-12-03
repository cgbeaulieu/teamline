$(document).ready(function(){
  var params;

  $("#teamline").on("mouseenter", ".event", function(){
    $(".secondary", this).slideToggle(500);
  })

  $("#teamline").on("mouseleave", ".event", function(){
    $(".secondary", this).slideToggle(500);
  })

  var filterToggle = false;


  $('#start_of').pickadate({
      format_submit: 'yyyy-mm-dd'
    })

  $('form#filterForm').submit(function(){
    filterToggle = true;
  });

  $('form#filterForm').bind('ajax:beforeSend', function(event, xhr, settings) {
      params = settings.url.replace(/filter/, 'infinite');
     //  var allVals = [];
     // $('form#filterForm input:checked').each(function() {
     //   allVals.push($(this).val());
     // });
     // alert(allVals);
  });

  $('form#filterForm').bind('ajax:success', function(xhr, data, status) {
      $("ol.timeline").html(data);
  });


  var buildParams = function(){
    var last_date = $('ol.timeline li.item:last').data('date');
    var search_params = { name: 'published_at', value: last_date }
    var final_params = search_params;
    
    if($('form#filterForm :checked').length){
      checked_params = $('form#filterForm').serializeArray();
      checked_params.push(search_params);
      final_params = checked_params;
    }
    return $.param(final_params);
  }

  var loadScrollDetect = function(){
    if ($(window).scrollTop() > $(document).height() - $(window).height() - 200) {    
      $(window).unbind('scroll');
      loadEvents();
    }
  };

  var loadEvents = function(){
    params = buildParams();
    var last_date = $('ol.timeline li.item:last').data('date');
    $.ajax({
      url: 'timeline/infinite',
      data: params,
      success: function(data){
        if (data.length > 1){
          $("ol.timeline").append(data);
        } else {
          var new_date = moment(last_date).subtract('days', 1).format('YYYY-MM-DD');
          new_date = String(new_date);
          $("ol.timeline li.item:last").after("<li class='item' display='none;' data-date='" + new_date + "'></li>");
        }
      },
      complete: function(date, textStatus){
        $(window).bind('scroll', loadScrollDetect);
      }
    });
  }

  $(window).bind('scroll', loadScrollDetect);

  $(setInterval(function(){
    if(filterToggle === false){
      var raw_date  = $('ol.timeline li.item:first').data('date');
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
  }, 20000));

function formatTimestamp(timestamp){
  return timestamp.replace(/Z/,'').replace(/T/, ' ');
}

});