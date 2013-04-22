class CreateAdRewards < ActiveRecord::Migration
  def change
    create_table :ad_rewards do |t|

      t.timestamps
    end
  end
end
