jQuery -> 
  if $('.pagination').length
    $(window).scroll ->
      url = $('.pagination .next_page').attr('href')
      if url && $(window).scrollTop() > $(document).height() -  $(window).height() - 100
        $('.pagination').text("Fetching the past...")
        $.getScript(url)
    $(window).scroll()