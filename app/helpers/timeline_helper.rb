module TimelineHelper
  def spine_position(index)
    if index % 2 == 0
      "right"
    else
      "left"
    end
  end
end
