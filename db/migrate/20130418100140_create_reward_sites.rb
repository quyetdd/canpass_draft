class CreateRewardSites < ActiveRecord::Migration
  def change
    create_table :reward_sites do |t|

      t.timestamps
    end
  end
end
