class CreateActionPrices < ActiveRecord::Migration
  def change
    create_table :action_prices do |t|

      t.timestamps
    end
  end
end
