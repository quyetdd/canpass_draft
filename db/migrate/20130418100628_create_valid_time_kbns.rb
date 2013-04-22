class CreateValidTimeKbns < ActiveRecord::Migration
  def change
    create_table :valid_time_kbns do |t|

      t.timestamps
    end
  end
end
