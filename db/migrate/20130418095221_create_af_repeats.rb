class CreateAfRepeats < ActiveRecord::Migration
  def change
    create_table :af_repeats do |t|

      t.timestamps
    end
  end
end
