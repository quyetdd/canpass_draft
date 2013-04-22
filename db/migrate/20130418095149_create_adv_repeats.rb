class CreateAdvRepeats < ActiveRecord::Migration
  def change
    create_table :adv_repeats do |t|

      t.timestamps
    end
  end
end
