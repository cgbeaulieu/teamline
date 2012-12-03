require 'spec_helper'

describe Timeline do
  before(:each) do
    @gh1 = GhEvent.create(:content => "gh1", :published_at => '2012-11-28')
    @t1  = Tweet.create(:content => "t1",:published_at => '2012-11-28')
    @p1  = Post.create(:content => "p1",:published_at => '2012-11-28')
    
    @gh2 = GhEvent.create(:content => "gh2",:published_at => '2012-11-29')
    @t2  = Tweet.create(:content => "t2",:published_at => '2012-11-30')
    @p2  = Post.create(:content => "p2",:published_at => '2012-11-30')
  end
  context ".load_recent_events" do
    it "should set events to some number" do
      timeline = Timeline.new
      timeline.load_recent_events(2)
      timeline.events.should == [@t2, @p2, @gh2]
    end
  end
  context ".format_grouped_events" do
    it "should turn the hash to an array and reverse it" do
      timeline = Timeline.new
      timeline.load_recent_events(6)
      timeline.group_by_date
      timeline.events.should== [
                         ['2012-11-30', [@p2, @t2]],
                         ['2012-11-29', [@gh2]],
                         ['2012-11-28', [@gh1,@p1, @t1]]
                       ]
    end
  end
end


      # timeline.events.should == 
      # [
      #   [(Date.today + 2.days), [@p2,@t2]],
      #   [(Date.today + 1.days), [@gh2]],
      #   [(Date.today),          [@gh1,@p1,@t1]]
      # ]
