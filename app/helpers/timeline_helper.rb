module TimelineHelper
  def spine_position(index)
    if index % 2 == 0
      "right"
    else
      "left"
    end
  end

  def event_type(event)
    event.class.to_s.downcase
  end

  def date_header_format(datestr)
    Date.strptime(datestr, "%Y-%m-%d").strftime("%B %d, %Y")
  end

end
