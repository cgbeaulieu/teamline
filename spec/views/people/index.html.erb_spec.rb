require 'spec_helper'

describe "people/index" do
  before(:each) do
    assign(:people, [
      stub_model(Person,
        :name => "Name",
        :rss_feed => "Rss Feed",
        :twitter_handle => "Twitter Handle",
        :gh_username => "Gh Username"
      ),
      stub_model(Person,
        :name => "Name",
        :rss_feed => "Rss Feed",
        :twitter_handle => "Twitter Handle",
        :gh_username => "Gh Username"
      )
    ])
  end

  it "renders a list of people" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Rss Feed".to_s, :count => 2
    assert_select "tr>td", :text => "Twitter Handle".to_s, :count => 2
    assert_select "tr>td", :text => "Gh Username".to_s, :count => 2
  end
end
