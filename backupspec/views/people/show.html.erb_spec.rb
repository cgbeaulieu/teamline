require 'spec_helper'

describe "people/show" do
  before(:each) do
    @person = assign(:person, stub_model(Person,
      :name => "Name",
      :rss_feed => "Rss Feed",
      :twitter_handle => "Twitter Handle",
      :gh_username => "Gh Username"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Rss Feed/)
    rendered.should match(/Twitter Handle/)
    rendered.should match(/Gh Username/)
  end
end
