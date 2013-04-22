class CreateRewardAppUserCookies < ActiveRecord::Migration
  def change
    create_table :reward_app_user_cookies do |t|

      t.timestamps
    end
  end
end
