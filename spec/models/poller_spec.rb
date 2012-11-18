require_relative '../../lib/poller'
require 'spec_helper'

describe Poller do
  context "#detect_new_events" do
    it "it returns any events greater than a date" do
      event = GhEvent.create
      time = event.created_at
      tweet = Tweet.create
      post  = Post.create
      results = Poller.detect_new_events(time)
      results.should == [post,tweet]
    end    
  end
end