class CreateLpoGroups < ActiveRecord::Migration
  def change
    create_table :lpo_groups do |t|

      t.timestamps
    end
  end
end
