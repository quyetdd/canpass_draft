class CreateActionPoints < ActiveRecord::Migration
  def change
    create_table :action_points do |t|

      t.timestamps
    end
  end
end
