class CreateAccesslogs < ActiveRecord::Migration
  def change
    create_table :accesslogs do |t|

      t.timestamps
    end
  end
end
