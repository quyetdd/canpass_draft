require 'spec_helper'

describe "apps/index" do
  before(:each) do
    assign(:apps, [
      stub_model(App,
        :config => "Config",
        :config.ru => "Config.Ru",
        :db => "Db",
        :doc => "Doc",
        :Gemfile => "Gemfile",
        :Gemfile.lock => "Gemfile.Lock",
        :lib => "Lib",
        :log => "Log",
        :public => "Public",
        :Rakefile => "Rakefile",
        :README.rdoc => "Readme.Rdoc",
        :script => "Script",
        :spec => "Spec",
        :test => "Test",
        :tmp => "Tmp",
        :vendor => "Vendor"
      ),
      stub_model(App,
        :config => "Config",
        :config.ru => "Config.Ru",
        :db => "Db",
        :doc => "Doc",
        :Gemfile => "Gemfile",
        :Gemfile.lock => "Gemfile.Lock",
        :lib => "Lib",
        :log => "Log",
        :public => "Public",
        :Rakefile => "Rakefile",
        :README.rdoc => "Readme.Rdoc",
        :script => "Script",
        :spec => "Spec",
        :test => "Test",
        :tmp => "Tmp",
        :vendor => "Vendor"
      )
    ])
  end

  it "renders a list of apps" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Config".to_s, :count => 2
    assert_select "tr>td", :text => "Config.Ru".to_s, :count => 2
    assert_select "tr>td", :text => "Db".to_s, :count => 2
    assert_select "tr>td", :text => "Doc".to_s, :count => 2
    assert_select "tr>td", :text => "Gemfile".to_s, :count => 2
    assert_select "tr>td", :text => "Gemfile.Lock".to_s, :count => 2
    assert_select "tr>td", :text => "Lib".to_s, :count => 2
    assert_select "tr>td", :text => "Log".to_s, :count => 2
    assert_select "tr>td", :text => "Public".to_s, :count => 2
    assert_select "tr>td", :text => "Rakefile".to_s, :count => 2
    assert_select "tr>td", :text => "Readme.Rdoc".to_s, :count => 2
    assert_select "tr>td", :text => "Script".to_s, :count => 2
    assert_select "tr>td", :text => "Spec".to_s, :count => 2
    assert_select "tr>td", :text => "Test".to_s, :count => 2
    assert_select "tr>td", :text => "Tmp".to_s, :count => 2
    assert_select "tr>td", :text => "Vendor".to_s, :count => 2
  end
end
