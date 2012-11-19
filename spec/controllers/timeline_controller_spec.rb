require 'spec_helper'

describe TimelineController do
  it "should return the object we created" do
    event = GhEvent.create(content: 'this is event', published_at: Time.now)
    expected = [event].to_json
    get :poll, {published_at: DateTime.now - 5.seconds}
    response.body.should == expected
  end
  
  it "should not return anything" do
    event = GhEvent.create(content: 'this is event', published_at: Time.now)
    expected = event.to_json
    get :poll, {published_at: Time.now + 1.seconds}
    response.body.should == "[]"
  end
end