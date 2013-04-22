class CreateAdnwRepeats < ActiveRecord::Migration
  def change
    create_table :adnw_repeats do |t|

      t.timestamps
    end
  end
end
