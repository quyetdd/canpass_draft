class CreateApps < ActiveRecord::Migration
  def change
    create_table :apps do |t|
      t.string :config
      t.string :config.ru
      t.string :db
      t.string :doc
      t.string :Gemfile
      t.string :Gemfile.lock
      t.string :lib
      t.string :log
      t.string :public
      t.string :Rakefile
      t.string :README.rdoc
      t.string :script
      t.string :spec
      t.string :test
      t.string :tmp
      t.string :vendor

      t.timestamps
    end
  end
end
