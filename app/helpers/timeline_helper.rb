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
end
