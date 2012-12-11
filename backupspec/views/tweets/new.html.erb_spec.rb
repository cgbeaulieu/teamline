require 'spec_helper'

describe "tweets/new" do
  before(:each) do
    assign(:tweet, stub_model(Tweet,
      :content => "MyText",
      :handle => "MyString"
    ).as_new_record)
  end

  it "renders new tweet form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => tweets_path, :method => "post" do
      assert_select "textarea#tweet_content", :name => "tweet[content]"
      assert_select "input#tweet_handle", :name => "tweet[handle]"
    end
  end
end
