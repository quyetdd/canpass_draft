class CreateSalesPrices < ActiveRecord::Migration
  def change
    create_table :sales_prices do |t|

      t.timestamps
    end
  end
end
