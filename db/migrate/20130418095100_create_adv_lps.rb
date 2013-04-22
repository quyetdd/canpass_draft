class CreateAdvLps < ActiveRecord::Migration
  def change
    create_table :adv_lps do |t|

      t.timestamps
    end
  end
end
