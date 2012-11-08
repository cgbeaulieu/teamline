require 'spec_helper'

describe RssParser do
  context ".update_feeds" do
    it "should not duplicate a saved post" do
      Post.create(created_at: '2012-10-29')
    end
  end
end