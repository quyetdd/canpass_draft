class CreateAdvManages < ActiveRecord::Migration
  def change
    create_table :adv_manages do |t|

      t.timestamps
    end
  end
end
