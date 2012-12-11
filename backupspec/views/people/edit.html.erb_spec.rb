require 'spec_helper'

describe "people/edit" do
  before(:each) do
    @person = assign(:person, stub_model(Person,
      :name => "MyString",
      :rss_feed => "MyString",
      :twitter_handle => "MyString",
      :gh_username => "MyString"
    ))
  end

  it "renders the edit person form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => people_path(@person), :method => "post" do
      assert_select "input#person_name", :name => "person[name]"
      assert_select "input#person_rss_feed", :name => "person[rss_feed]"
      assert_select "input#person_twitter_handle", :name => "person[twitter_handle]"
      assert_select "input#person_gh_username", :name => "person[gh_username]"
    end
  end
end
