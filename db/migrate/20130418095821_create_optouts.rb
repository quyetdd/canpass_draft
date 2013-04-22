class CreateOptouts < ActiveRecord::Migration
  def change
    create_table :optouts do |t|

      t.timestamps
    end
  end
end
