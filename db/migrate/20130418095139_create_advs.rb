class CreateAdvs < ActiveRecord::Migration
  def change
    create_table :advs do |t|

      t.timestamps
    end
  end
end
