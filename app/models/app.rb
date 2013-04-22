class App < ActiveRecord::Base
  attr_accessible :Gemfile, :Gemfile.lock, :README.rdoc, :Rakefile, :config, :config.ru, :db, :doc, :lib, :log, :public, :script, :spec, :test, :tmp, :vendor
end
