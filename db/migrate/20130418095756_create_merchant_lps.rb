class CreateMerchantLps < ActiveRecord::Migration
  def change
    create_table :merchant_lps do |t|

      t.timestamps
    end
  end
end
