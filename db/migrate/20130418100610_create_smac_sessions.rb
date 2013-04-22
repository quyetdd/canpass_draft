class CreateSmacSessions < ActiveRecord::Migration
  def change
    create_table :smac_sessions do |t|

      t.timestamps
    end
  end
end
