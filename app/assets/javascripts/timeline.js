$(document).ready(function(){

  $("#teamline").on("mouseenter", ".event", function(){
    $(".secondary", this).slideToggle(500);
  })

  $("#teamline").on("mouseleave", ".event", function(){
    $(".secondary", this).slideToggle(500);
  })

  //set up toggle to control polling as a global variable
  var filterToggle = false;

  //calendar plugin
  $('#start_of').pickadate({
    format_submit: 'yyyy-mm-dd'
  })

  //stop the pollling when someone is filtering
  $('form#filterForm').submit(function(){
    filterToggle = true;
  });

  //rails form success callback that inserts the data into the DOM
  $('form#filterForm').bind('ajax:success', function(xhr, data, status) {
      $("ol.timeline").html(data);
  });

  //submit form when checkbox is clicked for live filter
  $('form#filterForm input').on('click', function() {
    $(this).submit();
  });

  //create the paramers to be submitted to infinite scroll action based on what's selected and last date
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

  //watch to see when user scrolls down to a certain point on the page
  var loadScrollDetect = function(){
    if ($(window).scrollTop() > $(document).height() - $(window).height() - 200) {    
      $(window).unbind('scroll');
      loadEvents();
    }
  };

  //submit a GET request to load the next day's data
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

  //poll server to check for new data
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

  //make string timestamps friendly for active record queries
  function formatTimestamp(timestamp){
    return timestamp.replace(/Z/,'').replace(/T/, ' ');
  }

});