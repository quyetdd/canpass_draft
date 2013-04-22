class CreateAdvImpressionRegHistories < ActiveRecord::Migration
  def change
    create_table :adv_impression_reg_histories do |t|

      t.timestamps
    end
  end
end
