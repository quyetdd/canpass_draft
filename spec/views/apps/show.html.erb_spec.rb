require 'spec_helper'

describe "apps/show" do
  before(:each) do
    @app = assign(:app, stub_model(App,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Config/)
    rendered.should match(/Config.Ru/)
    rendered.should match(/Db/)
    rendered.should match(/Doc/)
    rendered.should match(/Gemfile/)
    rendered.should match(/Gemfile.Lock/)
    rendered.should match(/Lib/)
    rendered.should match(/Log/)
    rendered.should match(/Public/)
    rendered.should match(/Rakefile/)
    rendered.should match(/Readme.Rdoc/)
    rendered.should match(/Script/)
    rendered.should match(/Spec/)
    rendered.should match(/Test/)
    rendered.should match(/Tmp/)
    rendered.should match(/Vendor/)
  end
end
