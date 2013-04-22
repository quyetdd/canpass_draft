class CreateAdBanners < ActiveRecord::Migration
  def change
    create_table :ad_banners do |t|

      t.timestamps
    end
  end
end
