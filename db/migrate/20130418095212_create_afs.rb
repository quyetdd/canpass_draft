class CreateAfs < ActiveRecord::Migration
  def change
    create_table :afs do |t|

      t.timestamps
    end
  end
end
