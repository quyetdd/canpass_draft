class CreateMerchantBudgetRemainders < ActiveRecord::Migration
  def change
    create_table :merchant_budget_remainders do |t|

      t.timestamps
    end
  end
end
