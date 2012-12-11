# require 'spec_helper'

# describe Poller do
#   context "#find_new_events" do
#     it "it returns any events greater than a date" do
#       event = GhEvent.create(published_at: Time.now)
#       time = event.published_at
#       post,tweet = '', ''
#       Timecop.freeze(Time.now + 1) do
#         tweet = Tweet.create(published_at: Time.now)
#         post  = Post.create(published_at: Time.now)
#       end
#       results = Poller.find_new_events(time.to_s)
#       results.should == [post,tweet]
#     end
#   end
# end