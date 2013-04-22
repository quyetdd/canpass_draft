class CreateRewardBalanceAmountSaps < ActiveRecord::Migration
  def change
    create_table :reward_balance_amount_saps do |t|

      t.timestamps
    end
  end
end
