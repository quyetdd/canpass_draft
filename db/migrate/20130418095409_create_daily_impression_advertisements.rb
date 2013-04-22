class CreateDailyImpressionAdvertisements < ActiveRecord::Migration
  def change
    create_table :daily_impression_advertisements do |t|

      t.timestamps
    end
  end
end
