$(document).ready(function(){

  //set up toggle to control polling as a global variable
  var filterOff = false;

  $('form#filterForm li').click(function(){
    var el = $(this).find('input:checkbox');
    el.attr('checked', !el.attr('checked'));
    $('form#filterForm').submit();
  });

  //stop the pollling when someone is filtering
  $('form#filterForm').submit(function(){
    filterOff = true;
  });

  //calendar plugin
  $('#start_date').pickadate({
    format_submit: 'yyyy-mm-dd',
    onSelect: function() {
      $('form#filterForm').submit();
    }
  })

  //submit form when checkbox is clicked for live filter
  $('form#filterForm input').on('click', function() {
    $(this).submit();
  });

  //rails form success callback that inserts the data into the DOM
  $('form#filterForm').bind('ajax:success', function(xhr, data, status) {
      $("ol.timeline").html(data);
  });

  //create the paramers to be submitted to infinite scroll action based on what's selected and last date
  var buildParams = function(last_date){
    if($('form#filterForm :checked').length){
      var checked_params = $('form#filterForm').serializeArray();
      checked_params.push({ name: 'published_at', value: last_date });
      return $.param(checked_params);
    } else {
      var date = { published_at: last_date }
      return date;
    }
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
    var last_date = $('ol.timeline li.item:last').data('date');
    params = buildParams(last_date);
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
    if(filterOff === false){
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
  }, 3000));

  //make string timestamps friendly for active record queries
  function formatTimestamp(timestamp){
    return timestamp.replace(/Z/,'').replace(/T/, ' ');
  }

});