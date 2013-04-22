class CreateRedirectUrls < ActiveRecord::Migration
  def change
    create_table :redirect_urls do |t|

      t.timestamps
    end
  end
end
