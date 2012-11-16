jQuery -> 
  $(window).scroll ->
    if $(window).scrollTop() > $(document).height() -  $(window).height() - 100
      $.getScript($('.pagination .next_page').attr('href'))