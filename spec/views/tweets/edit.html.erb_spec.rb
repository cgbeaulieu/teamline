require 'spec_helper'

describe "tweets/edit" do
  before(:each) do
    @tweet = assign(:tweet, stub_model(Tweet,
      :content => "MyText",
      :handle => "MyString"
    ))
  end

  it "renders the edit tweet form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => tweets_path(@tweet), :method => "post" do
      assert_select "textarea#tweet_content", :name => "tweet[content]"
      assert_select "input#tweet_handle", :name => "tweet[handle]"
    end
  end
end
