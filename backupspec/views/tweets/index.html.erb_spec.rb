require 'spec_helper'

describe "tweets/index" do
  before(:each) do
    assign(:tweets, [
      stub_model(Tweet,
        :content => "MyText",
        :handle => "Handle"
      ),
      stub_model(Tweet,
        :content => "MyText",
        :handle => "Handle"
      )
    ])
  end

  it "renders a list of tweets" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Handle".to_s, :count => 2
  end
end
