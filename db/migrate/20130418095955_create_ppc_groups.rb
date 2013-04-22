class CreatePpcGroups < ActiveRecord::Migration
  def change
    create_table :ppc_groups do |t|

      t.timestamps
    end
  end
end
