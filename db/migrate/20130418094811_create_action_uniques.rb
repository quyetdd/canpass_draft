class CreateActionUniques < ActiveRecord::Migration
  def change
    create_table :action_uniques do |t|

      t.timestamps
    end
  end
end
