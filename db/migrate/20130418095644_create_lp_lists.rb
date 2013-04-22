class CreateLpLists < ActiveRecord::Migration
  def change
    create_table :lp_lists do |t|

      t.timestamps
    end
  end
end
