require 'spec_helper'

describe "apps/edit" do
  before(:each) do
    @app = assign(:app, stub_model(App,
      :config => "MyString",
      :config.ru => "MyString",
      :db => "MyString",
      :doc => "MyString",
      :Gemfile => "MyString",
      :Gemfile.lock => "MyString",
      :lib => "MyString",
      :log => "MyString",
      :public => "MyString",
      :Rakefile => "MyString",
      :README.rdoc => "MyString",
      :script => "MyString",
      :spec => "MyString",
      :test => "MyString",
      :tmp => "MyString",
      :vendor => "MyString"
    ))
  end

  it "renders the edit app form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", app_path(@app), "post" do
      assert_select "input#app_config[name=?]", "app[config]"
      assert_select "input#app_config.ru[name=?]", "app[config.ru]"
      assert_select "input#app_db[name=?]", "app[db]"
      assert_select "input#app_doc[name=?]", "app[doc]"
      assert_select "input#app_Gemfile[name=?]", "app[Gemfile]"
      assert_select "input#app_Gemfile.lock[name=?]", "app[Gemfile.lock]"
      assert_select "input#app_lib[name=?]", "app[lib]"
      assert_select "input#app_log[name=?]", "app[log]"
      assert_select "input#app_public[name=?]", "app[public]"
      assert_select "input#app_Rakefile[name=?]", "app[Rakefile]"
      assert_select "input#app_README.rdoc[name=?]", "app[README.rdoc]"
      assert_select "input#app_script[name=?]", "app[script]"
      assert_select "input#app_spec[name=?]", "app[spec]"
      assert_select "input#app_test[name=?]", "app[test]"
      assert_select "input#app_tmp[name=?]", "app[tmp]"
      assert_select "input#app_vendor[name=?]", "app[vendor]"
    end
  end
end
